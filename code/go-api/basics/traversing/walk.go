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

	// walk the value
	val.Walk(preprinter, postcounter)

	// print count
	fmt.Println("\n\nCount:", cnt)
}
