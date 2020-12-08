package day08

import (
	"list"
	"strconv"
	"strings"
)

limit: int | *2 @tag(iter,type=int)

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

// instructions: _ins

#calc: {
	iter: {
		"0": {
			acc: 0
			ptr: 0
			// evald: {...}
			evald: []
		}

		for i, I in list.Range(1,limit,1) {
			"\(i+1)": {
				let l = iter["\(i)"]
				if l.done != _|_ {
					done: true
					lastAcc: l.lastAcc
				}
				if l.done == _|_ {
					last: { acc: l.acc, ptr: l.ptr, evald: l.evald, if l.lastAcc != _|_ { lastAcc: l.lastAcc } }
					curr: _ins["\(last.ptr)"]
					// evald: last.evald & { "\(last.ptr)": last.acc }
					evald: list.FlattenN([last.evald, last.ptr], 1)

					if curr.op == "nop" {
						acc: last.acc
						ptr: last.ptr + 1
						if list.Contains(evald, ptr) {
						// if evald["\(ptr)"] != _|_ {
							done: true
							if last.lastAcc == _|_ {
								lastAcc: acc
							}
							if last.lastAcc != _|_ {
								lastAcc: last.lastAcc
							}
						}
					}
					
					if curr.op == "jmp" {
						acc: last.acc
						ptr: last.ptr + curr.n
						if list.Contains(evald, ptr) {
						// if evald["\(ptr)"] != _|_ {
							done: true
							if last.lastAcc == _|_ {
								lastAcc: acc
							}
							if last.lastAcc != _|_ {
								lastAcc: last.lastAcc
							}
						}
					}

					if curr.op == "acc" {
						acc: last.acc + curr.n
						ptr: last.ptr + 1
						if list.Contains(evald, ptr) {
						// if evald["\(ptr)"] != _|_ {
							done: true
							if last.lastAcc == _|_ {
								lastAcc: acc
							}
							if last.lastAcc != _|_ {
								lastAcc: last.lastAcc
							}
						}
					}
				}


			}
			
		}
	}
}
