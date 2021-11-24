package main

import (
	"fmt"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

func main() {
	c := cuecontext.New()
	d, _ := os.ReadFile("value.cue")
	val := c.CompileBytes(d)
	val = val.LookupPath(cue.ParsePath("obj"))

	// without options
	fmt.Println("Without\n---------")
	printFields(val.Fields())

	// default options
	fmt.Println("Default\n---------")
	printFields(val.Fields(defaultOptions...))

	// custom options
	fmt.Println("Custom\n---------")
	printFields(val.Fields(customOptions...))

}

func printFields(iter *cue.Iterator, err error) {
	for iter.Next() {
		fmt.Printf("%v: %v\n", iter.Selector(), iter.Value())
	}
	fmt.Println()
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
