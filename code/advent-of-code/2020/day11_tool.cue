package day11

import (
	"list"
	"strings"
	"text/template"
	"tool/file"
	"tool/cli"
)

iter: int @tag(iter,type=int)

let lastFN = template.Execute("day11/{{ printf \"%03.0f\" . }}.txt", iter-1)
let currFN = template.Execute("day11/{{ printf \"%03.0f\" . }}.txt", iter)

command: sol: {
	print: cli.Print & {
		text: "iter: \(iter)  \(lastFN) -> \(currFN)"
	}
	read: file.Read & {
		filename: lastFN
		contents: string
	}
	//regurg: cli.Print & {
		//text: "---\n" + read.contents + "---\n\n"
	//}
	progress: cli.Print & {
		
		text: "   same: \(#calc.next.same)  seats: \(#calc.next.seats)"
	}
	//result: cli.Print & {
		//text: "---\n" + #calc.next.pretty + "---\n\n"
	//}
	write: file.Create & {
		filename: currFN
		contents: #calc.next.pretty
	}
}

_input: command.sol.read.contents
_lines: strings.Split(_input, "\n")
_runes: [for _, L in _lines {
	strings.Runes(L)
}]

_nums: [for _, L in _runes if len(L) > 0 {
	[for _, R in L {
	({
		if R != 35 { val: 0 }
		if R == 35 { val: 1 }
	}).val
	}]
}]
// _nums: #nums

Y: len(_lines)-1
_YR: list.Range(0,Y,1)
X: len(_lines[0])-1
_XR: list.Range(0,X+1,1)

#calc: {
	last: _nums
	next: {
		let Grid = [ for y, _ in _YR {
			[for x, _ in _XR {
				let R = _runes[y][x]
				// floor, always 0
				if R == 46 {
					val: 0
					rune: "."
				}
				// not floor, calculate
				if R != 46 {

					// default calculations for neighbors
					_n: 0 | *last[y-1][x]
					_ne: 0 | *last[y-1][x+1]
					_e: 0 | *last[y][x+1]
					_se: 0 | *last[y+1][x+1]
					_s: 0 | *last[y+1][x]
					_sw: 0 | *last[y+1][x-1]
					_w: 0 | *last[y][x-1]
					_nw: 0 | *last[y-1][x-1]

					// sum of neighbors
					C: _n + _ne + _e + _se + _s + _sw + _w + _nw
					// current value for this cell
					c: last[y][x]

					// next value for this cell, defaults to current
					val: int | *c

					// empty becomes occupied
					if c == 0 && C == 0 {
						val: 1
					}
					// occupied becomes empty
					if c == 1 && C >= 4 {
						val: 0
					}

					if val == 0 {
						rune: "L"
					}
					if val == 1 {
						rune: "#"
					}
					
				}
			}]
		}]
		_grid: [ for y, _ in _YR { [for x, _ in _XR { Grid[y][x].val }] } ]
		same: _grid == last
		pretty: strings.Join([ for y, _ in _YR { strings.Join([for x, _ in _XR { Grid[y][x].rune }], "") } ], "\n") + "\n"
		seats: strings.Count(pretty, "#")
	}
}
