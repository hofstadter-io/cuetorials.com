package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
)

const schema = `
{
	i: int
	s: string
}
`

const constraint = `
{
	i: >10
	s: =~"^foo"
}
`

const val = `
{
	i: 100
	s: "foobar"
}
`

const bad = `
{
	i: uint
	s: string
}
`

func main() {
	c := cuecontext.New()
	s := c.CompileString(schema, cue.Filename("schema.cue"))
	r := c.CompileString(constraint, cue.Filename("constrain.cue"))
	v := c.CompileString(val, cue.Filename("val.cue"))
	b := c.CompileString(bad, cue.Filename("bad.cue"))

	// check subsumptions
	printErr("s > r", s.Subsume(r))
	printErr("r > s", r.Subsume(s))

	printErr("s > v", s.Subsume(v))
	printErr("v > s", v.Subsume(s))

	printErr("s > b", s.Subsume(b))
	printErr("b > v", b.Subsume(v))
}

func printErr(prefix string, err error) {
	if err != nil {
		msg := errors.Details(err, nil)
		fmt.Printf("%s:\n%s\n", prefix, msg)
	}
}
