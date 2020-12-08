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

#parseLine: {
	in: string
	flds: strings.Split(in, " ")
	ins: {
		op: flds[0]
		n: strconv.ParseInt(flds[1], 10, 32)
	}
}

_ins: { for i, l in _lines { "\(i)": (#parseLine & { in: l }).ins, ... } }

#calc2: {
	for o, O in OPS {
		"op-\(o)": {
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

			_iter: {
				"0": {
					acc: 0
					ptr: 0
				}

				for i, I in list.Range(1,limit,1) {
					"\(i+1)": {
						let l = _iter["\(i)"]
						if l.done != _|_ {
							done: true
							lastAcc: l.lastAcc
						}

						if l.done == _|_ {
							let last = l
							curr: _INS["\(last.ptr)"]

							if TARGET - last.ptr < 2 {
								done: true
								lastAcc: last.acc
							}

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

	for o, O in OPS {
		let iter = #calc2["op-\(o)"]._iter
		let ll = len(iter)-1
		let L = iter["\(ll)"]

		"final-\(o)": {
			last: L
		}
	}
}


// instructions: _ins

TARGET: len(_ins)-1

//#calc: {
	//iter: {
		//"0": {
			//acc: 0
			//ptr: 0
			//evald: []
		//}

		//for i, I in list.Range(1,limit,1) {
			//"\(i+1)": {
				//let l = iter["\(i)"]
				//if l.done != _|_ {
					//done: true
					//lastAcc: l.lastAcc
				//}
				//if l.done == _|_ {
					//last: { acc: l.acc, ptr: l.ptr, evald: l.evald, if l.lastAcc != _|_ { lastAcc: l.lastAcc } }
					//curr: _INS["\(last.ptr)"]
					//evald: last.evald + [last.ptr]

					//if curr.op == "nop" {
						//acc: last.acc
						//ptr: last.ptr + 1
						//if list.Contains(evald, ptr) {
							//done: true
							//if last.lastAcc == _|_ {
								//lastAcc: acc
							//}
							//if last.lastAcc != _|_ {
								//lastAcc: last.lastAcc
							//}
						//}
					//}
					
					//if curr.op == "jmp" {
						//acc: last.acc
						//ptr: last.ptr + curr.n
						//if list.Contains(evald, ptr) {
							//done: true
							//if last.lastAcc == _|_ {
								//lastAcc: acc
							//}
							//if last.lastAcc != _|_ {
								//lastAcc: last.lastAcc
							//}
						//}
					//}

					//if curr.op == "acc" {
						//acc: last.acc + curr.n
						//ptr: last.ptr + 1
						//if list.Contains(evald, ptr) {
							//done: true
							//if last.lastAcc == _|_ {
								//lastAcc: acc
							//}
							//if last.lastAcc != _|_ {
								//lastAcc: last.lastAcc
							//}
						//}
					//}
				//}


			//}
			
		//}
	//}
//}

// runs from part 1, must be one of these
// runs: [0, 265, 266, 267, 268, 182, 488, 489, 19, 530, 531, 532, 533, 534, 199, 184, 185, 287, 288, 289, 290, 291, 561, 562, 563, 564, 307, 308, 309, 310, 311, 519, 520, 521, 525, 526, 214, 215, 165, 166, 221, 64, 65, 66, 67, 413, 414, 415, 416, 479, 480, 481, 482, 385, 386, 387, 388, 389, 123, 127, 128, 129, 251, 252, 253, 380, 189, 472, 473, 7, 575, 576, 577, 578, 587, 588, 178, 179, 180, 403, 404, 569, 570, 571, 572, 573, 462, 463, 464, 465, 466, 194, 446, 447, 71, 72, 73, 74, 75, 115, 116, 117, 395, 453, 454, 455, 456, 95, 96, 97, 314, 315, 441, 442, 430, 431, 432, 433, 327, 328, 329, 330, 331, 155, 156, 157, 11, 14, 15, 16, 543, 544, 545, 546, 599, 600, 24, 25, 26, 2, 3, 4, 5, 109, 110, 111, 112, 34, 35, 273, 536, 537, 538, 508, 509, 510, 241, 242, 243, 244, 245, 210, 337, 338, 368, 369, 370, 421, 422, 423, 424, 425, 146, 147, 148, 149, 582, 583, 584, 585, 280, 281, 282, 226, 227, 29, 373, 374]

// used to filter runs, must actually be one of these
// ops: [ for _, r in runs if _ins["\(r)"].op != "acc" { r } ]
// OPS: [0, 265, 266, 268, 182, 489, 19, 534, 199, 185] // 291, 564, 308, 311, 521, 525, 526, 215, 166, 221, 66, 67, 416, 480, 482, 389, 123, 129, 253, 380, 189, 473, 7, 578, 588, 180, 404, 573, 462, 466, 194, 446, 447, 72, 75, 115, 117, 395, 454, 456, 97, 315, 442, 433, 331, 155, 157, 11, 16, 543, 546, 600, 24, 26, 4, 5, 111, 112, 35, 273, 538, 510, 245, 210, 338, 370, 425, 147, 149, 583, 585, 282, 227, 29, 373, 374]
OPS: [
	// 0, 265, 266, 268, 182, 489, 19, 534, 199, 185,
	// 291, 564, 308, 311, 521, 525, 526, 215, 166, 221,
	// 66, 67, 416, 480, 482, 389, 123, 129, 253, 380, 189,

	// 473, 7, 578, 588, 180, 404, 573, 462, 466, 194, 446,
	// 447, 72, 75, 115, 117, 395, 454, 456, 97, 315, 442,
	// 433, 331, 155, 157, 11, 16, 543, 546, 600, 24, 26,
	// 4, 5, 111, 112, 35, 273, 538, 510, 245, 210, 338,
	// 370, 425, 147, 149, 583, 585, 282, 227, 29, 373, 374,
	425,
]
LOPS: len(OPS)
