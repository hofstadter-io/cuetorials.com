package day03

import (
	"list"
	"strings"
)

// input strings in a separte file
// _input: _example
_input: _real

// determine rows, columns
_rows: strings.Split(_input, "\n")
nrows: len(_rows)
ncols: len(_rows[0])

// some list helpers
_RR1: list.Range(0,nrows,1)
_RR2: list.Range(0,nrows,2)
// bytecode for a tree '#'
_Tree: 35

// determine if a tree is at a position
#step: {
	r: int
	c: int
	m: c mod ncols
	t: strings.ByteAt(_rows[r], m)
	T: (t & _Tree) != _|_
}

// calculat steps
_ps: [for i, I in _RR1  { #step & { r: i, c: i*3 } }]
// filter for trees
_ts: [ for i, S in _ps if S.T { S } ]
// answer to part 1, len of filtered
ans1: len(_ts)

// make a run with step size as parameters
#run: {
	// parameterized input
	R: int
	C: int
	_RR: [...]
	// same idea as above for part 1
	_ps: [for i, I in _RR { #step & { r: i*R, c: i*C } }]
	_ts: [ for i, S in _ps if S.T { S } ]
	NT: len(_ts)
}

runs:{
	// slope and loop helper inputs
	_rs: [
		{ R: 1, C: 1, _RR: _RR1 },
		{ R: 1, C: 3, _RR: _RR1 },
		{ R: 1, C: 5, _RR: _RR1 },
		{ R: 1, C: 7, _RR: _RR1 },
		{ R: 2, C: 1, _RR: _RR2 },
	]
	// loop over runs
	_RS: [ for r, R in _rs { #run & R } ]
	// get tree count for each run
	ts: [ for t, T in _RS { T.NT } ]

	// answer to part 2, calc the product of the tree counts
	NT: list.Product(ts)
} 
