package day08

import (
	"list"
	"strconv"
	"strings"
)

limit: int | *10 @tag(iter,type=int)

// inputs in separate file, see github
// _input: _example
_input: _real

// split input into logical groups
_lines: strings.Split(_input, "\n")

// parse lines into more usable instructions
#parseLine: {
	in: string
	flds: strings.Split(in, " ")
	ins: {
		op: flds[0]
		n: strconv.ParseInt(flds[1], 10, 32)
	}
}

// convert instructions to a lookup table
_ins: { for i, l in _lines { "\(i)": (#parseLine & { in: l }).ins, ... } }

// This will answer part 1, the iterations change to { done, lastAcc } once the loop is discovered
#calc1: {
	iter: {
		"0": {
			// initial state values, we have to "update" this in each iteration entry because Cue doesn't allow updating values
			acc: 0
			ptr: 0
			evald: []
		}

		for i, I in list.Range(1,limit,1) {
			// iteration object start, we use i+1 becuase it's 1 less than I and aligns correctly
			"\(i+1)": {
				// the last iteration state
				let l = iter["\(i)"]

				// check if we are done
				if l.done == _|_ && list.Contains(l.evald, l.ptr) {
					done: true
					lastAcc: l.acc
				}

				// copy forward done
				if l.done != _|_ {
					done: true
					lastAcc: l.lastAcc
				}
				
				// only do work if we are not doen
				if l.done == _|_ {

					// filtered last instruction, otherwise last keeps nesting
					last: { acc: l.acc, ptr: l.ptr, evald: l.evald, if l.lastAcc != _|_ { lastAcc: l.lastAcc } }
					curr: _ins["\(last.ptr)"]
					// build up evald list
					evald: last.evald + [last.ptr]

					// run ops, update state

					if curr.op == "nop" {
						acc: last.acc
						ptr: last.ptr + 1
					}
					
					if curr.op == "jmp" {
						acc: last.acc
						ptr: last.ptr + curr.n
					}

					if curr.op == "acc" {
						acc: last.acc + curr.n
						ptr: last.ptr + 1
					}
				}
			}
		}
	}
}

// we just have to get close enough due to the last few instructions
TARGET: len(_ins)-1

// runs from part 1, must be one of these, there were extracted from part1 output
// runs: [0, 265, 266, 267, 268, 182, 488, 489, 19, 530, 531, 532, 533, 534, 199, 184, 185, 287, 288, 289, 290, 291, 561, 562, 563, 564, 307, 308, 309, 310, 311, 519, 520, 521, 525, 526, 214, 215, 165, 166, 221, 64, 65, 66, 67, 413, 414, 415, 416, 479, 480, 481, 482, 385, 386, 387, 388, 389, 123, 127, 128, 129, 251, 252, 253, 380, 189, 472, 473, 7, 575, 576, 577, 578, 587, 588, 178, 179, 180, 403, 404, 569, 570, 571, 572, 573, 462, 463, 464, 465, 466, 194, 446, 447, 71, 72, 73, 74, 75, 115, 116, 117, 395, 453, 454, 455, 456, 95, 96, 97, 314, 315, 441, 442, 430, 431, 432, 433, 327, 328, 329, 330, 331, 155, 156, 157, 11, 14, 15, 16, 543, 544, 545, 546, 599, 600, 24, 25, 26, 2, 3, 4, 5, 109, 110, 111, 112, 34, 35, 273, 536, 537, 538, 508, 509, 510, 241, 242, 243, 244, 245, 210, 337, 338, 368, 369, 370, 421, 422, 423, 424, 425, 146, 147, 148, 149, 582, 583, 584, 585, 280, 281, 282, 226, 227, 29, 373, 374]

// used to filter runs, must actually be one of these
// ops: [ for _, r in runs if _ins["\(r)"].op != "acc" { r } ]
OPS: [
	 0, 265, 266, 268, 182, 489, 19, 534, 199, 185,
	 291, 564, 308, 311, 521, 525, 526, 215, 166, 221,
	 66, 67, 416, 480, 482, 389, 123, 129, 253, 380, 189,
	 473, 7, 578, 588, 180, 404, 573, 462, 466, 194, 446,
	 447, 72, 75, 115, 117, 395, 454, 456, 97, 315, 442,
	 433, 331, 155, 157, 11, 16, 543, 546, 600, 24, 26,
	 4, 5, 111, 112, 35, 273, 538, 510, 245, 210, 338,
	 370, 425, 147, 149, 583, 585, 282, 227, 29, 373, 374,
]

// this will calculate the answer for part 2
// you will have to look through the reduce output
#calc2: {
	// loop over ops which exec'd from part1
	for o, O in OPS {
		// object for op O
		"op-\(o)": {
			// create the new instruction list, swapping op O
			let _INS = {
				for i, I in _ins {
					let swapi = "\(O)"

					"\(i)": {
						if i != swapi { I }
						if i == swapi {
							if I.op == "nop" {
								op: "jmp"
								n: I.n
							}
							if I.op == "jmp" {
								op: "nop"
								n: I.n
							}
							if I.op == "acc" {
								I
							}
						}
					}
				}
			}

			// iterations object for loop O
			_iter: {
				"0": {
					// reduced state, don't worry about tracking evald
					acc: 0
					ptr: 0
				}

				// instruction loop
				for i, I in list.Range(1,limit,1) {
					// instruction object
					"\(i+1)": {
						// previous state
						let l = _iter["\(i)"]

						// copy forward done
						if l.done != _|_ {
							done: true
							lastAcc: l.lastAcc
						}

						// only do work when not done
						if l.done == _|_ {
							let last = l
							curr: _INS["\(last.ptr)"]

							// check if we are at the target instruction pointer (near the end of the instructions)
							if TARGET - last.ptr < 2 {
								done: true
								lastAcc: last.acc
							}

							// run the instructions

							if curr.op == "nop" {
								acc: last.acc
								ptr: last.ptr + 1
							}
							
							if curr.op == "jmp" {
								acc: last.acc
								ptr: last.ptr + curr.n
							}

							if curr.op == "acc" {
								acc: last.acc + curr.n
								ptr: last.ptr + 1
							}
						}

					}
					
				}
			}

		}
	}

	// now that we processed all ops for all iterations
	// we can extract the last operation so we can find the "done" op
	// this will be the op which needs to be swapped, the acc will be correct
	for o, O in OPS {
		let iter = #calc2["op-\(o)"]._iter
		let ll = len(iter)-1
		let L = iter["\(ll)"]

		"final-\(o)": {
			last: L
		}
	}
}
