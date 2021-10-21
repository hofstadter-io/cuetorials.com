package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

const val = `
i: int
s: string
t: [string]: string
_h: "hidden"
#d: foo: "bar"
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
	fmt.Printf("// %%v\n%v\n\n// %%# v\n%# v\n", v, v)
}
