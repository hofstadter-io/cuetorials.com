package day07

import (
	"list"
	"strconv"
	"strings"
)

limit: int | *5 @tag(iter,type=int)

// inputs in separate file, see github
_input: _example
// _input: _real

// split input into logical groups
_lines: strings.Split(_input, "\n")
numLines: len(_lines)

#parseRule: {
	in: string
	sides: strings.Split(in, " contain ")

	lhs: sides[0]
	bag: strings.TrimRight(lhs, " bags")

	rhs: sides[1]

	flds: strings.Split(rhs, ", ")

	inner: {
		for f, F in flds if F != "no other bags." {
			let ss = strings.Split(F, " ")
			let i = strconv.Atoi(ss[0])
			"\(ss[1]) \(ss[2])": i
		}
	}

}

_rules: [ for i, l in _lines { #parseRule & { in: l } } ]

rulez: {
	for r, R in _rules {
		"\(R.bag)": R
	}
}

#calc3: {
	iter: {
		"0": {
			bags: {
				"shiny gold": {
					count: 1
					rule: rulez["shiny gold"].inner
				}
			}
			sum: 1
		}

		// loop until iteration limit is reached
		for i, I in list.Range(1,limit,1) {
			"\(i+1)": {
				bags: {
					for b, B in iter["\(i)"].bags {
						B.rule
					}
				}
			}
		}
	}
}

ans: #calc3
