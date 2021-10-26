package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
)

const val = `
v: {
	i: int
	s: "hello"
	#d: "defn"
	_h: "hidden"
	o?: string
}
`

func main() {
	c := cuecontext.New()
	v := c.CompileString(val, cue.Filename("val.cue"))

	// check for errors during compiling
	if v.Err() != nil {
		msg := errors.Details(v.Err(), nil)
		fmt.Printf("Compile Error:\n%s\n", msg)
	}
	// print v
	fmt.Printf("%#v\n", v)

	// eval evaluates and returns a new value
	e := v.Eval()
	if e.Err() != nil {
		msg := errors.Details(e.Err(), nil)
		fmt.Printf("Eval Error:\n%s\n", msg)
	}

	// print e
	fmt.Printf("%#v\n", e)
}
