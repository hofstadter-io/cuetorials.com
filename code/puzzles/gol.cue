package gol

import (
	"list"
	"strings"
)

iters: int | *1 @tag(iters,type=int)

init55: [
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
]

init33: [
	[0, 0, 0],
	[1, 1, 1],
	[0, 0, 0],
]

init: init33

// the dimensions of our grid
Y:   len(init) - 1
_YR: list.Range(0, Y+1, 1)
X:   len(init[0]) - 1
_XR: list.Range(0, X+1, 1)

#GameOfLife: {
	// our initial state
	"0": {
		_grid: init
	}

	// loop over iterations
	for i, _ in list.Range(0, iters, 1) {
		// get the last iteration grid
		let last = #GameOfLife["\(i)"]._grid

		// this iteration
		"\(i+1)": {
			let Grid = [ for y, _ in _YR {
				[ for x, _ in _XR {
					// default calculations for neighbors
					// Note, we don't need to check edges
					//   and use Cue's null coalescing to handle the edge cases!
					_n:  0 | *last[y-1][x]
					_ne: 0 | *last[y-1][x+1]
					_e:  0 | *last[y][x+1]
					_se: 0 | *last[y+1][x+1]
					_s:  0 | *last[y+1][x]
					_sw: 0 | *last[y+1][x-1]
					_w:  0 | *last[y][x-1]
					_nw: 0 | *last[y-1][x-1]

					// sum of neighbors
					C: _n + _ne + _e + _se + _s + _sw + _w + _nw
					// current value for this cell
					c: last[y][x]

					// next value for this cell, defaults to dead
					v: int | *0
					r: *" " | "#"

					// dead cell becomes alive
					if c == 0 && C == 3 {
						v: 1
						r: "#"
					}

					// living cell remains alive
					if c == 1 {
						if C == 2 || C == 3 {
							v: 1
							r: "#"
						}
					}

				}]
			}]
			_grid: [ for y, _ in _YR {[ for x, _ in _XR {Grid[y][x].v}]}]
			state: strings.Join([ for y, _ in _YR {strings.Join([ for x, _ in _XR {Grid[y][x].r}], "")}], "\n")
		}

	}
}
