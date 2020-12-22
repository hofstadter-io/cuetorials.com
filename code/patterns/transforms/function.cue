package function

import "strings"

// An input schema
#Input: {
	count: int
	msg: string
}

// An output schema
#Output: {
	val: string
}

#Transform: {
	// Input for the caller
	in: #Input
	// output for the caller
	out: #Output

	// intermediate fields
	_upper: strings.ToUpper(in.msg)
	_msg: strings.Join([_upper] * in.count, " ")

	// set output
	out: val: _msg
}

// Call transform
loudly: #Transform & { in: { msg: "ra", count: 3 } }

