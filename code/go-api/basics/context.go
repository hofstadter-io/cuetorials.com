package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

const val = `
i: int
foo: "bar"
`

func main() {
	var (
		c *cue.Context
		v cue.Value
	)

	// create a context
	c = cuecontext.New()

	// compile some CUE into a Value
	v = c.CompileString(val)

	// print the value
	fmt.Println(v)
}
