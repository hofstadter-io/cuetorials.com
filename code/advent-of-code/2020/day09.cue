package day09

import (
	"list"
	"strconv"
	"strings"
)

// used for bounded looping
limit: int | *len(_lines) @tag(iter,type=int)

// _iters: list.Range(1,limit,1)

// dummy for input
_strconv: strconv.Atoi("10")

// inputs in separate file, see github
//preamble: 5
//_input: _example
 preamble: 25
 _input: _real


// split input into logical groups
_lines: strings.Split(_input, "\n")

nums: [for _, l in _lines { strconv.Atoi(l) }]

#twosum: {
	ns: [...int]
	n: int
	ds: [for _, x in ns { n - x }]
	ms: [for _, x in ds if list.Contains(ns, x) { 
		n1: x
		n2: n - x
	}]
	found: len(ms) > 0
	if found == true {
		T: ms[0]
	}
}

_step1: [ for i, N in nums if i >= preamble {
	let ns = list.Slice(nums, i-preamble, i)
	let S = (#twosum & { "ns": ns, "n": N })
	if S.found {
		t: S.T
	}
	if !S.found {
		broke: N
	}
}]

ans1: [for _, s in _step1 if s.broke != _|_ { s.broke }]
weak1: ans1[0]

C: int | *2 @tag(C,type=int)
D: int | *30 @tag(D,type=int)
_step2: {
	for i, _ in list.Range(C, D+1, 1) {
		let L = i+C
		let tmp = [ for i, N in nums if i >= L && N < weak1 {
			let ns = list.Slice(nums, i-L, i)
			let sum = list.Sum(ns)
			if sum == weak1 {
				min: list.Min(ns)
				max: list.Max(ns)
				weak2: min+max
			}
		}]
	"\(L)": [for _, s in tmp if s.weak2 != _|_ { s.weak2 }]
	}

}

ans2: [for _, s in _step2 if len(s) > 0 { s[0] }]

