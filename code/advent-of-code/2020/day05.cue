package day05

import (
	"list"
	"strconv"
	"strings"
)

// _input: _example1
_input: _real1

_lines: strings.Split(_input, "\n")

// F -> 0
// B -> 1
// L -> 0
// R -> 1

#parse: {
	in: string
	rowS: strings.TrimRight(in, "LR")
	colS: strings.TrimLeft(in, "FB")
	rowB: strings.Replace(strings.Replace(rowS, "B", "1", -1), "F", "0", -1)
	colB: strings.Replace(strings.Replace(colS, "R", "1", -1), "L", "0", -1)
	rowI: strconv.ParseInt(rowB, 2, 64)
	colI: strconv.ParseInt(colB, 2, 64)

	ID: rowI * 8 + colI
}

_p1a: [ for i, I in _lines { #parse & { in: I } }]
_ids: [ for i, I in _p1a { I.ID } ]
ans1: list.Max(_ids)

_sorted: list.Sort(_ids, list.Ascending)

first: _sorted[0]
last: _sorted[len(_sorted)-1]

count: len(_sorted)
diff: last-first

missing: {
	for i, x in list.Range(first, last+1, 1) {
		if !list.Contains(_sorted, i+first) {
			Missing: x
		}
	}
}
