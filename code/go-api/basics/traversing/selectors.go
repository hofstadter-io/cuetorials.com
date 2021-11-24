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

	// printing the label vs path
	sub := val.LookupPath(cue.ParsePath("obj.sub"))
	fmt.Println(sub.Path(), getLabel(sub))
}

// helper function for getting the label for a value
func getLabel(val cue.Value) cue.Selector {
	ss := val.Path().Selectors()
	s := ss[len(ss)-1]
	return s
}
