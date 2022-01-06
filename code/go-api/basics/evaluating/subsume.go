package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
)

const schemaWithNumber =`
{
	i: number
	s: string
}
`

const schemaWithInt = `
{
	i: int
	s: string
}
`

const constraint = `
{
	i: >10 // this will only be subsumed by number, not int
	s: =~"^foo"
}
`

const val = `
{
	i: 100
	s: "foobar"
}
`

const constraintType = `
{
	i: uint
	s: string
}
`

func main() {
	ctx := cuecontext.New()
	sn := ctx.CompileString(schemaWithNumber, cue.Filename("schema_number.cue"))
	si := ctx.CompileString(schemaWithInt, cue.Filename("schema_int.cue"))
	c := ctx.CompileString(constraint, cue.Filename("constraint.cue"))
	v := ctx.CompileString(val, cue.Filename("val.cue"))
	b := ctx.CompileString(constraintType, cue.Filename("bad.cue"))

	// check subsumptions
	printErr("sn > c", sn.Subsume(c))
	printErr("c > sn", c.Subsume(sn))

	printErr("sn > v", sn.Subsume(v))
	printErr("v > sn", v.Subsume(sn))

	// this seems not intuitive, we'll talk it later
	printErr("si > c", si.Subsume(c))
	printErr("c > si", c.Subsume(si))

	printErr("si > v", si.Subsume(v))
	printErr("v > si", v.Subsume(si))


	printErr("s > b", si.Subsume(b))
	printErr("b > v", b.Subsume(v))
}

func printErr(prefix string, err error) {
	if err != nil {
		msg := errors.Details(err, nil)
		fmt.Printf("%s:\n%s\n", prefix, msg)
	}
}
