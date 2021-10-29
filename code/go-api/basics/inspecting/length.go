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
	d,_ := os.ReadFile("value.cue")
	val := c.CompileBytes(d)

	paths := []string{
		"a",
		"d.e",
		"d.g",
		"l",
		"b",
	}

	for _, path := range paths {
		fmt.Printf("====  %s  ====\n", path)
		v := val.LookupPath(cue.ParsePath(path))
		p := v.Path()
		k := v.IncompleteKind()
		l := v.Len()
		fmt.Printf("%q %v %v\n%# v\n", p, k, l, v)
	}
}
