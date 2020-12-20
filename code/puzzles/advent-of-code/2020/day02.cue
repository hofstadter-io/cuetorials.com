package day02

import "strconv"
import "strings"

input: _example

#case: {
	min: int
	max: int
	char: string
	pass: string

	count: int & strings.Count(pass, char)
	valid1: bool & min <= count && count <= max

	runes: strings.Runes(pass)
	c0: strings.Runes(char)[0]
	r1: runes[min-1]
	r2: runes[max-1]
	valid2: bool & r1 != r2 && (r1 == c0 || r2 == c0)
}

#checkLine: {
	in: string

	_flds: [string, string, string]
	_flds: strings.Fields(in)
	
	_nums: strings.Split(_flds[0], "-")

	out: #case & {
		min: strconv.Atoi(_nums[0])
		max: strconv.Atoi(_nums[1])
		char: strings.TrimSuffix(_flds[1], ":")
		pass: _flds[2]
	}
}

#checkCases: {
	_in: string
	_lines: strings.Split(_in, "\n")
	_cases: [...#checkLine] & [ for l, L in _lines { in: L } ]
	// for debugging,  _cases / cases
	_Cases: _cases
	part1: len([ for c, C in _Cases if C.out.valid1 { C } ])
	part2: len([ for c, C in _Cases if C.out.valid2 { C } ])
}

answer: (#checkCases & { _in: _real })

