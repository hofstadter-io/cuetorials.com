package main

import (
	"fmt"
	"os"

	"cuelang.org/go/cue"
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
	d, _ := os.ReadFile("value.cue")
	val := c.CompileBytes(d)

	// before (pre-order) traversal
	preprinter := func(v cue.Value) bool {
		fmt.Printf("%v\n", v)
		return true
	}

	// after (post-order) traversal
	cnt := 0
	postcounter := func(v cue.Value) {
		cnt++
	}

	Walk(val, preprinter, postcounter, customOptions...)

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
			options = defaultOptions
		}
		s, _ := v.Fields(options...)

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

// Cue's default
var defaultOptions = []cue.Option{
	cue.Attributes(true),
	cue.Concrete(false),
	cue.Definitions(false),
	cue.DisallowCycles(false),
	cue.Docs(false),
	cue.Hidden(false),
	cue.Optional(false),
	cue.ResolveReferences(false),
	// The following are not set
	// nor do they have a bool arg
	// cue.Final(),
	// cue.Raw(),
	// cue.Schema(),
}

// Our custom options
var customOptions = []cue.Option{
	cue.Definitions(true),
	cue.Hidden(true),
	cue.Optional(true),
}
