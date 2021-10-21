package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

type Val struct {
	I int    `json:"i"`
	S string `json:"s,omitempty"`
	b bool
}

func main() {
	var (
		c *cue.Context
		v cue.Value
	)

	val := Val {
		I: 1,
		S: "hello",
		b: true,
	}

	// create a context
	c = cuecontext.New()

	// compile some CUE into a Value
	v = c.Encode(val)

	// print the value
	fmt.Println(v)

	// we can also encode types
	t := c.EncodeType(Val{})
	fmt.Println(t)
}
