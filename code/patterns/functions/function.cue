package function

import (
	"list"
	"strings"
)

// An input schema
#Input: {
	count: int
	msg:   string
}

// An output schema
#Output: {
	val: string
}

#Transform: {
	// Input for the caller
	X1="in": #Input
	// output for the caller
	out: #Output

	// intermediate fields
	_upper: strings.ToUpper(X1.msg)
	_msg: strings.Join(list.Repeat([_upper], X1.count), " ")

	// set output
	out: val: _msg
}

// Call transform
result: #Transform & {in: {msg: "ra", count: 3}}
