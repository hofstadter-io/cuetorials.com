package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
)

const schema = `
#schema: {
	i: int
	s: string
}
`

const val = `
v: #schema & {
	i: "hello"
	s: 1
}
`

func main() {
	c := cuecontext.New()
	s := c.CompileString(schema, cue.Filename("schema.cue"))
	v := c.CompileString(val, cue.Scope(s), cue.Filename("val.cue"))

	// check for errors during compiling
	if v.Err() != nil {
		msg := errors.Details(v.Err(), nil)
		fmt.Printf("Compile Error:\n%s\n", msg)
	}

	// To get all errors, we need to validate
	err := v.Validate()
	if err != nil {
		msg := errors.Details(err, nil)
		fmt.Printf("Validate Error:\n%s\n", msg)
	}
}
