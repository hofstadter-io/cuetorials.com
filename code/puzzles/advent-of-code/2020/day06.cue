package day06

import (
	"list"
	"strconv"
	"strings"
)

// inputs in separate file, see github
// _input: _example
_input: _real

// split input into logical groups
_inputs: strings.Split(_input, "\n\n")

#calcYes: {
	X1="in": string
	// count num lines for part2
	numL: strings.Count(X1, "\n") + 1
	// convert input into single string
	cl: strings.Replace(X1, "\n", "", -1)
	// convert to runes for looping
	rs: strings.Runes(cl)
	ls: {
		for i, r in rs {
			// we will have a key if the letter has been answered (part1)
			// we compare the count in the original to the num lines (part2)
			// some strconv work to convert rune to string of len(1)
			"\(r)": strings.Count(cl, strconv.Unquote(strconv.QuoteRune(r))) == numL
		}
	}
	// count num fields for part1
	cnt1: len(ls)
	// count num true for part2
	cnt2: len([ for i, l in ls if l {l}])
}

// run inputs through calc
_calced: [ for i, G in _inputs {(#calcYes & {in: G})}]

// sum counts to get answers
ans1: list.Sum([ for i, G in _calced {G.cnt1}])
ans2: list.Sum([ for i, G in _calced {G.cnt2}])
