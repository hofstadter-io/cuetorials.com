package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/format"
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

	// Generate an AST
	//   try out different options
	syn := v.Syntax(
		cue.Final(), // close structs and lists
		cue.Concrete(false),   // allow incomplete values
		cue.Definitions(false),
		cue.Hidden(true),
		cue.Optional(true),
		cue.Attributes(true),
		cue.Docs(true),
	)

	// Pretty print the AST, returns ([]byte, error)
	bs, _ := format.Node(syn)

	fmt.Println(string(bs))
}
