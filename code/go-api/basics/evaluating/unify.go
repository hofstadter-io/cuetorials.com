package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
)

const schema = `
v: {
	i: int
	s: string
}
`

const val = `
v: {
	i: "hello"
	s: 1
}
`

func main() {
	c := cuecontext.New()
	s := c.CompileString(schema, cue.Filename("schema.cue"))
	v := c.CompileString(val, cue.Filename("val.cue"))

	// unify the schema and value
	u := s.Unify(v)

	// check for errors during unification
	if u.Err() != nil {
		msg := errors.Details(u.Err(), nil)
		fmt.Printf("Unify Error:\n%s\n", msg)
	}

	// To get all errors, we need to validate
	err := u.Validate()
	if err != nil {
		msg := errors.Details(err, nil)
		fmt.Printf("Validate Error:\n%s\n", msg)
	}

	// print u
	fmt.Printf("%#v\n", u)
}
