package scope

import (
	"list"
)

calc: {
	state: {
		"0": {
			ptr: 0
			acc: 0
		}
	}

	for i, I in list.Range(1,10,1) {
		let last = state["\(i)"]
		state: {
			"\(i+1)": {
				ptr: last.ptr + 1
				acc: last.acc + I
			}
		}
	}
}
