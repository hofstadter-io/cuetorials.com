package day05

import (
	"list"
	"strconv"
	"strings"
)

// inputs in separate file, see github
// _input: _example1
_input: _real1

_lines: strings.Split(_input, "\n")

// map letters to binary
// F -> 0
// B -> 1
// L -> 0
// R -> 1

#parse: {
	in: string

	// get row string, sub 0/1, parse binary int
	rowS: strings.TrimRight(in, "LR")
	rowB: strings.Replace(strings.Replace(rowS, "B", "1", -1), "F", "0", -1)
	rowI: strconv.ParseInt(rowB, 2, 64)

	// get col string, sub 0/1, parse binary int
	colS: strings.TrimLeft(in, "FB")
	colB: strings.Replace(strings.Replace(colS, "R", "1", -1), "L", "0", -1)
	colI: strconv.ParseInt(colB, 2, 64)

	// calculate ID
	ID: rowI * 8 + colI
}

// parse lines to structs
_p1a: [ for i, I in _lines { #parse & { in: I } }]
// extract IDs
_ids: [ for i, I in _p1a { I.ID } ]
// sort IDs for part2
_sorted: list.Sort(_ids, list.Ascending)
// first and last numbers for part2
_first: _sorted[0]
_last: _sorted[len(_sorted)-1]

// part1 answer is max of all ids
ans1: list.Max(_ids)

// find missing
missing: {
	for i, x in list.Range(first, last+1, 1) {
		if !list.Contains(_sorted, i+first) {
			Missing: x
		}
	}
}

// answer to part2
ans2: missing.Missing
