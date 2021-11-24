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

	// lookup a list value
	val = val.LookupPath(cue.ParsePath("obj.list"))

	// we use iterators to traverse a list
	// List() returns an iterator
	iter, _ := val.List()

	// This pattern is standard iteration
	// We get the current element and nil at the end
	for iter.Next() {
		fmt.Println(iter.Value())
	}
}
