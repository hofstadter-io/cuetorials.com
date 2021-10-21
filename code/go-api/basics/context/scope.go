package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

const schema = `
#schema: {
	i: int
	s: string
}
`

const val = `
v: #schema & {
	i: 1
	s: "hello"
}
`

func main() {
	var (
		c *cue.Context
		s cue.Value
		v cue.Value
	)

	// create a context
	c = cuecontext.New()

	// compile our schema first
	s = c.CompileString(schema)

	// compile our value with scope
	v = c.CompileString(val, cue.Scope(s))

	// print the value
	fmt.Println(v)
}
