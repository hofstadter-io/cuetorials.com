package main

import (
	"fmt"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

func main() {
	c := cuecontext.New()

	// read and compile value
	d, _ := os.ReadFile("value.cue")
	val := c.CompileBytes(d)

	paths := []string{
		"a",
		"a.e",
		"d.g",
		"l",
		"b",
		"x.y",
	}

	for _, path := range paths {
		v := val.LookupPath(cue.ParsePath(path))
		k := v.Kind()
		i := v.IncompleteKind()
		fmt.Printf("%q %v %v %v\n", path, k, i, v)
	}
}
