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
	j: int
	_inc: i+1
	#k: *(_inc + j) | 0
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

	v = v.FillPath(cue.ParsePath("v.i"), 1)

	k := v.LookupPath(cue.ParsePath("v.#k"))
	fmt.Printf("%#v\n", k)

	fmt.Println("----------")
	// eval evaluates and returns a new value
	e := v.Eval()
	if e.Err() != nil {
		msg := errors.Details(e.Err(), nil)
		fmt.Printf("Eval Error:\n%s\n", msg)
	}
	fmt.Printf("%#v\n", e)
	k = v.LookupPath(cue.ParsePath("v.#k"))
	fmt.Printf("%#v\n", k)


	v = v.FillPath(cue.ParsePath("v.j"), 3)

	k = v.LookupPath(cue.ParsePath("v.#k"))
	fmt.Printf("%#v\n", k)

	fmt.Println("----------")
	e = v.Eval()
	if e.Err() != nil {
		msg := errors.Details(e.Err(), nil)
		fmt.Printf("Eval Error:\n%s\n", msg)
	}
	fmt.Printf("%#v\n", e)
	k = v.LookupPath(cue.ParsePath("v.#k"))
	fmt.Printf("%#v\n", k)

	fmt.Println("----------")
	v.Validate(cue.Final(),cue.Concrete(true),cue.Definitions(true))
	fmt.Printf("%#v\n", e)
	k = v.LookupPath(cue.ParsePath("v.#k"))
	ik, _ := k.Int64()
	fmt.Printf("%#v == %v\n", k, ik)
}

