package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/cuecontext"
)

const input = `
a: {
	i: int
	j: int | *i
}
`

func main() {
	c := cuecontext.New()
	val := c.CompileString(input)

	fmt.Println("\noriginal\n===============")
	val.Walk(func(v cue.Value) bool {
		fmt.Printf("\n%# v\n", v)
		return true
	}, nil)

	val = val.FillPath(cue.ParsePath("a.i"), 42)

	fmt.Println("\nfilled\n===============")
	val.Walk(func(v cue.Value) bool {
		fmt.Printf("\n%# v\n", v)
		return true
	}, nil)

	// val.Evaluate(cue.Final())

	a := val.Syntax(cue.Final(), cue.Concrete(true))
	val = c.BuildExpr(a.(ast.Expr))

	fmt.Println("\nfinal (hypothetical)\n===============")
	val.Walk(func(v cue.Value) bool {
		fmt.Printf("\n%# v\n", v)
		return true
	}, nil)

}

var defaultWalkOptions = []cue.Option{
	cue.Attributes(true),
	cue.Concrete(false),
	cue.Definitions(true),
	cue.Hidden(true),
	cue.Optional(true),
}

// Walk is an alternative to cue.Value.Walk which handles more field types
// You can customize this with your own options
func Walk(v cue.Value, before func(cue.Value) bool, after func(cue.Value), options ...cue.Option) {

	// call before and possibly stop recursion
	if before != nil && !before(v) {
		return
	}

	// possibly recurse
	switch v.IncompleteKind() {
	case cue.StructKind:
		if options == nil {
			options = defaultWalkOptions
		}
		s, _ := v.Fields( options...)

		for s.Next() {
			Walk(s.Value(), before, after, options...)
		}

	case cue.ListKind:
		l, _ := v.List()
		for l.Next() {
			Walk(l.Value(), before, after, options...)
		}

	// no default (basic lit types)

	}

	if after != nil {
		after(v)
	}

}

