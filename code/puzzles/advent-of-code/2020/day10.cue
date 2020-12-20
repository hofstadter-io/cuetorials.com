package day10

import (
	"list"
	"strconv"
	"strings"
)

iter: int | *10 @tag(iter,type=int)

// inputs in separate file, see github
// _input: _example1
// _input: _example2
_input: _real

// process input a sorted int list
_lines: strings.Split(_input, "\n")
_orig: [for _, l in _lines { strconv.Atoi(l) }]
jolts: list.Sort(_orig, list.Ascending)


// some stats
numJolts: len(jolts)
minJolt: list.Min(jolts)
maxJolt: list.Max(jolts)
devJolt: maxJolt+3

// calc loop over input
#calc1: {
	// set outlet
	"0": {
		pos: 0
		jolts: 0
		diff: 0
		run: 0
	}
	// set device
	"\(numJolts+1)": {
		pos: numJolts+1
		jolts: devJolt
		diff: 3
		run: 0
	}

	for j, J in jolts {
		let last = #calc1["\(j)"]
		let D = J - last.jolts

		"\(j+1)": {
			pos: j+1
			diff: D
			jolts: J

			// run is the "run" of 1's in a row
			run: int | *0
			if diff == 1 {
				run: last.run + 1
			}
		}

	}
}

// part 1, #1's * #3's
diff1: len([for _, I in #calc1 if I.diff == 1 { I }])
diff3: len([for _, I in #calc1 if I.diff == 3 { I }])
ans1: diff1 * diff3

// calculate the possibilities
poss: [for i, I in #calc1 if i != "0" {
	let ii = strconv.Atoi(i)
	 let Last = #calc1["\(ii-1)"]

	 run: I.run
	 last: Last.run

	val: int | *1
	// everytime we hit a zero, we can calculate a multiplier
	if run == 0 {
		// 0,0 : (0,3,6) : means we cannot remove an element in the run
		if last == 0 {
			val: 1
		}
		// 1,0 : (0,3,4,7) : mean we cannot remove an element in the run
		if last == 1 {
			val: 1
		}
		// 2,0 : (0,3,4,5,8) : mean we can keep or remove the middle element
		if last == 2 {
			val: 2
		}
		// 3,0 : (0,3,4,5,6,9) : mean we can keep or remove the middle 2 elements, four possibilities [kk,kr,rk,rr]
		if last == 3 {
			val: 4
		}
		// 4,0 : (0,3,4,5,6,7,10) : mean we can keep or remove the middle 3 elements, four possibilities [kkk,kkr,krk,krr,rkk,rkr,rrk] (no rrr)
		if last == 4 {
			val: 7
		}
	}
}]

Poss: [for _,I in poss { I.val }]
ans2: list.Product(Poss)
