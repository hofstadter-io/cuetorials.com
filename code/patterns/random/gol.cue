package gol

import "list"

#grid: [...[...int]]

init55: #grid & [
	[0,0,0,0,0],
	[0,0,0,0,0],
	[0,1,1,1,0],
	[0,0,0,0,0],
	[0,0,0,0,0],
]

init33: #grid & [
	[0,0,0],
	[1,1,1],
	[0,0,0],
]

init: init33

M: len(init)-1

#cell: {
	// grid and position
	_grid: #grid
	x: int
	y: int

	// default calculations for neighbors
	_n: int | *_grid[y-1][x]
	_ne: int | *_grid[y-1][x+1]
	_e: int | *_grid[y][x+1]
	_se: int | *_grid[y+1][x+1]
	_s: int | *_grid[y+1][x]
	_sw: int | *_grid[y+1][x-1]
	_w: int | *_grid[y][x-1]
	_nw: int | *_grid[y-1][x-1]

	// sum of neighbors
	C: _n + _ne + _e + _se + _s + _sw + _w + _nw
	// current value for this cell
	c: _grid[x][y]
	// next value for this cell, defaults to dead
	r: int | *0

	// dead cell becomes alive
	if c == 0 && C == 3 {
		r: 1
	}
	// living cell remains alive
	if c == 1 {
		if C == 2 || C == 3 {
			r: 1
		}
	}
	
	// check if we are on the edges and set to zero
	// this prevents the calculations which would out-of-bounds
	if y == 0 {
		_n: 0
		_ne: 0
		_nw: 0
	}
	if y == M {
		_s: 0
		_se: 0
		_sw: 0
	}
	if x == 0 {
		_w: 0
		_nw: 0
		_sw: 0
	}
	if x == M {
		_e: 0
		_ne: 0
		_se: 0
	}

	...
}

// Make a single step
#step: {
	_G: #grid
	out: [for y, Row in _G {
		[ for x, Col in Row { (#cell & { _grid: _G, "x": x, "y": y }).r }]
	}]
}

// Two methods, both can only take 2 steps before a structural cycle is detected, bug?
steps: {
	"0": init
	"1": (#step & { _G: steps["0"] })
	"2": (#step & { _G: steps["1"].out })
	// "3": (#step & { _G: steps["2"].out })
}

#calc: {
	steps: 3
	RR: list.Range(0,steps, 1)
	ss: {
		"0": { out: init }
		for i, I in RR {
			let G = ss["\(I)"].out
			"\(I+1)": (#step & { _G: G })
		}
	}
}

//step000: init
//step001: (#step & { _G: step000 })
//step002: (#step & { _G: step001.out })
// step003: (#step & { _G: step002.out })
//step004: (#step & { _G: step003.out })
//step005: (#step & { _G: step004.out })
//step006: (#step & { _G: step005.out }).out
