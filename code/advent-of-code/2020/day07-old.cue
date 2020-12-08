package day07

import (
	"list"
	"strconv"
	"strings"
)

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
numRules: len(_rules)

colors: list.Sort([ for r, R in _rules { R.bag } ], list.Ascending)

pairs: {
	for c, C in colors {
		let cs = strings.Split(C, " ")
		prefix: {
			"\(cs[0])": true
		}
		suffix: {
			"\(cs[1])": true
		}
	}
}

nR: 610-16

limit: int | *5 @tag(iter,type=int)

#calc: {
	_iter: {
		"0": {
			bags: ["shiny gold"]
			rules: _rules
		}

		// loop until iteration limit is reached
		for i, I in list.Range(1,limit,1) {

			// for each rule, for each previous _bags, if a bag is in the Rule.rhs, then add it
			let tmp = list.FlattenN([ for r, R in _iter["\(i)"].rules {
				[for b, B in _iter["\(i)"].bags {
					if strings.Contains(R.rhs, B) {
						R
					}
				}]
			}], 1)

			// merge new with last
			let ll = list.FlattenN([[ for t, T in tmp if T.bag != _|_ { T.bag } ], _iter["\(i)"].bags], 1)
			// make unique, stage 1
			let ls = {
				for l, L in ll {
					"\(L)": true
				}
			}
			// make unique, stage 2, store for next iteration
			"\(i+1)": {
				bags: [ for l, _ in ls { l } ]
				rules: _rules
				// rules: [ for r, R in _iter["\(i)"] ]
			}
		}

	}

	counts: {
		for i, I in list.Range(1,limit+1,1) {
			"\(i+1)": len(_iter["\(i)"].bags)-1
			
		}
	}

	// final: list.Sort(_bags["\(limit-1)"], list.Ascending)
	// lenF: len(final)

}

#calc2: {
	_iter: {
		"0": {
			bags: ["shiny gold"]
		}

		// loop until iteration limit is reached
		for i, I in list.Range(1,limit,1) {
			let B = _iter["\(i)"]
			let tmp = [ for r, R in _rules {
			
				if strings.Contains(R.rhs, B) {
					R
				}
			}]

			// merge new with last
			let ll = list.FlattenN([[ for t, T in tmp if T.bag != _|_ { T.bag } ], _iter["\(i)"].bags], 1)
			// make unique, stage 1
			let ls = {
				for l, L in ll {
					"\(L)": true
				}
			}
			// make unique, stage 2, store for next iteration
			"\(i+1)": {
				bags: [ for l, _ in ls { l } ]
				rules: _rules
				// rules: [ for r, R in _iter["\(i)"] ]
			}
		}

	}

	counts: {
		for i, I in list.Range(1,limit+1,1) {
			"\(i+1)": len(_iter["\(i)"].bags)-1
			
		}
	}

	// final: list.Sort(_bags["\(limit-1)"], list.Ascending)
	// lenF: len(final)

}

rulez: {
	for r, R in _rules {
		"\(R.bag)": R
	}
}

#calc3: {
	iter: {
		"0": {
			bags: {
				"shiny gold": 1
			}
		}

		// loop until iteration limit is reached
		for i, I in list.Range(1,limit,1) {
			"\(i+1)": "dummy"		
		}
	}
}

ans: #calc3
