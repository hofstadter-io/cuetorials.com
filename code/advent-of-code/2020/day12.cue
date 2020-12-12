package day12

import (
	"math"
	"strconv"
	"strings"
)

// _input: _example
_input: _real

_lines: strings.Split(_input, "\n")

_ins: [for _, L in _lines {
	d: strings.Split(L,"")[0]
	v: strconv.Atoi(strings.TrimLeft(L,d))
}]

print: _ins

// rotate left table
rL: {
	"N": {
			"90": "W"			
			"180": "S"
			"270": "E"
	}
	"S": {
			"90": "E"			
			"180": "N"
			"270": "W"
	}
	"E": {
			"90": "N"			
			"180": "W"
			"270": "S"
	}
	"W": {
			"90": "S"			
			"180": "E"
			"270": "N"
	}
}

// rotate right table
rR: {
	"N": {
		"90": "E"			
		"180": "S"
		"270": "W"
	}
	"S": {
		"90": "W"			
		"180": "N"
		"270": "E"
	}
	"E": {
		"90": "S"			
		"180": "W"
		"270": "N"
	}
	"W": {
		"90": "N"			
		"180": "E"
		"270": "S"
	}
}

RL: {
	_x: int
	_y: int
	"90": { 
		x: -1*_y
		y: 1*_x
	}
	"180": {
		x: -1*_x
		y: -1*_y
	}
	"270": {
		x: 1*_y
		y: -1*_x
	}			
}

RR: {
	_x: int
	_y: int
	"90": { 
		x: 1*_y
		y: -1*_x
	}			
	"180": {
		x: -1*_x
		y: -1*_y
	}
	"270": { 
		x: -1*_y
		y: 1*_x
	}
}

#loop: {
	"0": {
		x: 0,
		y: 0,
		d: "E"
		M: 0

		// part2
		wX: 10
		wY: 1
		pX: 0
		pY: 0
		pM: 0
	}

	for i, I in _ins {
		let last = #loop["\(i)"]
		"\(i+1)": {
			"I": I

			x: int | *last.x
			y: int | *last.y
			d: string | *last.d
			M: math.Abs(x) + math.Abs(y)

			wX: number | *last.wX
			wY: number | *last.wY
			pX: number | *last.pX
			pY: number | *last.pY
			pM: math.Abs(pX) + math.Abs(pY)

			if I.d == "N" {
				y: last.y + I.v
				wY: last.wY + I.v
			}

			if I.d == "S" {
				y: last.y - I.v
				wY: last.wY - I.v
			}

			if I.d == "E" {
				x: last.x + I.v
				wX: last.wX + I.v
			}

			if I.d == "W" {
				x: last.x - I.v
				wX: last.wX - I.v
			}

			if I.d == "L" {
				d: rL[last.d]["\(I.v)"]
				let c = (RL & { _x: last.wX, _y: last.wY })["\(I.v)"]
				wX: c.x
				wY: c.y
			}

			if I.d == "R" {
				d: rR[last.d]["\(I.v)"]
				let c = (RR & { _x: last.wX, _y: last.wY })["\(I.v)"]
				wX: c.x
				wY: c.y
			}

			if I.d == "F" {

				// part1
				if last.d == "N" {
					y: last.y + I.v
				}
				if last.d == "S" {
					y: last.y - I.v
				}
				if last.d == "E" {
					x: last.x + I.v
				}
				if last.d == "W" {
					x: last.x - I.v
				}

				// part2
				pX: last.pX + (last.wX * I.v)
				pY: last.pY + (last.wY * I.v)
			}

		}
	}
}
