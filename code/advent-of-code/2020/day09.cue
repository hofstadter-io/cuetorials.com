package day09

import (
	"list"
	"strconv"
	"strings"
)

// inputs in separate file, see github
//preamble: 5
//_input: _example
 preamble: 25
 _input: _real


// split input into logical groups
_lines: strings.Split(_input, "\n")

nums: [for _, l in _lines { strconv.Atoi(l) }]

// calc for 2 sums
#twosum: {
	// inputs, int list and target num
	ns: [...int]
	n: int

	// take difference
	ds: [for _, x in ns { n - x }]
	// make an element if the diff is also in original
	ms: [for _, x in ds if list.Contains(ns, x) { 
		n1: x
		n2: n - x
	}]

	// did we find a pair?
	found: len(ms) > 0
	if found == true {
		T: ms[0]
	}
}

// calc for part1
_step1: [ for i, N in nums if i >= preamble {
	// get a slice of the numbers
	let ns = list.Slice(nums, i-preamble, i)
	// run 2sum on the slice
	let S = (#twosum & { "ns": ns, "n": N })
	// check for not found
	if !S.found {
		// set to the number
		broke: N
	}
}]

// trim output
_ans1: [for _, s in _step1 if s.broke != _|_ { s.broke }]
weak1: _ans1[0]

// helper inputs for bounds on part2
C: int | *2 @tag(C,type=int)
D: int | *30 @tag(D,type=int)

// calc for part 2
_step2: {
	// loop over our consecutive ints bounds
	for i, _ in list.Range(C, D+1, 1) {
		// consecutive numbers value
		let L = i+C
		// loop over nums
		let tmp = [ for i, N in nums if i >= L && N < weak1 {
			// slice of L consecutive numbers
			let ns = list.Slice(nums, i-L, i)
			let sum = list.Sum(ns)
			// does the some equal the weak number from part1?
			if sum == weak1 {
				_min: list.Min(ns)
				_max: list.Max(ns)
				// set weak value for part 2
				weak2: min+max
			}
		}]
		
		// filter output to a list of 0/1 elements
		"\(L)": [for _, s in tmp if s.weak2 != _|_ { s.weak2 }]
	}

}

// trim output, find the one list with an element
_ans2: [for _, s in _step2 if len(s) > 0 { s[0] }]
// we might not find any if the answer is not within our consecutive numbers bounds
if len(_ans2) > 0 {
	weak2: _ans2[0]
}

