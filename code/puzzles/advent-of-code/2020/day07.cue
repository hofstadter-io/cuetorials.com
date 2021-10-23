package day07

import (
	"list"
	"strconv"
	"strings"
)

limit: int | *2 @tag(iter,type=int)

// inputs in separate file, see github
// _input: _example
_input: _real

// split input into logical groups
_lines:   strings.Split(_input, "\n")
numLines: len(_lines)

#parseRule: {
	X1="in": string
	sides:   strings.Split(X1, " contain ")

	lhs: sides[0]
	bag: strings.TrimSuffix(lhs, " bags")

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

_rules: [ for i, l in _lines {#parseRule & {in: l}}]

//#calc: {
//_iter: {
//"0": {
//bags: ["shiny gold"]
//rules: _rules
//}

//for i, I in list.Range(1,limit,1) {
//let tmp = [ for r, R in _iter["\(i)"].rules {
//for b, B in _iter["\(i)"].bags {
//if strings.Contains(R.rhs, B) {
//R
//}
//}
//}]

//let ll = list.FlattenN([[ for t, T in tmp if T.bag != _|_ { T.bag } ], _iter["\(i)"].bags], 1)
//let ls = {
//for l, L in ll {
//"\(L)": true
//}
//}
//"\(i+1)": {
//bags: [ for l, _ in ls { l } ]
//rules: [ for r, R in _iter["\(i)"].rules if !list.Contains(bags, R.bag) { R } ]
//}
//}

//}

//counts: {
//for i, I in list.Range(1,limit+1,1) {
//"\(i+1)": len(_iter["\(i)"].bags)-1

//}
//}

//}

_rulez: {
	for i, R in _rules {
		"\(R.bag)": R
	}
}

//listOfBags: list.Sort([for i, R in _rules { R.bag }], list.Ascending)

//numRules: len(_rules)
//numRulez: len(_rulez)

//// rulez: _rulez

//print: _rulez["posh magenta"]

#calc2: {
	iter: {
		"0": {
			bags: [{
				bag:   "shiny gold"
				count: 1
				rule:  _rulez["shiny gold"].inner
			}]
			sum: list.Sum(list.FlattenN([ for _, B in bags {[ for _, cnt in B.rule {B.count * cnt}]}], 1))
		}

		for i, I in list.Range(1, limit, 1) {
			"\(i+1)": {
				bags: list.FlattenN([ for b, B in iter["\(i)"].bags {
					[ for r, cnt in B.rule {
						bag:   r
						count: B.count * cnt
						rule:  _rulez["\(r)"].inner
					}]
				}], 1)
				counts: [ for _, B in bags {[ for _, cnt in B.rule {B.count * cnt}]}]
				sum: list.Sum(list.FlattenN(counts, 1))
			}
		}
	}

	sums: [ for _, I in iter {I.sum}]
	total: list.Sum(sums) + 1
}

ans: #calc2
