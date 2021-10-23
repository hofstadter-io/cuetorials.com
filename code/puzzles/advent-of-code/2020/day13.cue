package day13

import (
	"list"
	"strconv"
	"strings"
)

iters: int | *25 @tag(iters,type=int)

_input: _example
// _input: _real

_lines: strings.Split(_input, "\n")

start: strconv.Atoi(_lines[0])

_bus: strings.Split(_lines[1], ",")
bus: [ for _, B in _bus if B != "x" {strconv.Atoi(B)}]

offset: start
//#loop: {
//"\(offset)": {}
//for i, _ in list.Range(0, iters, 1) {
//let I = i + offset
//let last = #loop["\(I-1)"]
//"\(I)": {
//for _, B in bus { 
//if last.bus != _|_ {
//bus: last.bus
//}
//if last.bus == _|_ {
//if I mod B == 0 {
//bus: {
//time: I
//diff: I-start
//route: B
//val: diff * B
//}
//}
//}
//}
//}
//}
//}

first: int | *2439024390243 @tag(first,type=int)
loops: int | *1000          @tag(loops,type=int)

//elems: [17,-1,13,19]
// elems: [67,7,59,61]
// elems: [67,-1,7,59,61]
//elems: [67,7,-2,59,61]
//elems: [1789,37,47,1889]

_elems: strings.Split(_real2, ",")
elems: [ for e, E in _elems {
	({
		if E == "x" {val: -1}
		if E != "x" {val: strconv.Atoi(E)}
	}).val
}]

mul: elems[0]

#calc: {
	for i, _ in list.Range(first, first+loops, 1) {
		let I = (first + i) * mul
		let mods = [ for b, B in elems if B > 0 {
			__mod((I + b), B)
		}]
		let sums = list.Sum(mods)

		if sums < 1 {
			"\(i+first)": {
				FOUND: I
			}
		}
		if (first+loops)-(first+i) < 2 {
			"\(i+first)": {
				f:   first
				"i": i
				"I": I
				ms:  mods
				sum: sums
			}
		}
	}
}

ans2: {
	for _, C in #calc {
		if ans2.found == _|_ {
			if C.FOUND != _|_ {
				found: C.FOUND
			}
		}
	}
}
