package main

import (
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

func main() {
	c := cuecontext.New()
	d, _ := os.ReadFile("value.cue")
	val := c.CompileBytes(d)
}

func getLabel(val cue.Value) cue.Selector {
	ss := val.Path().Selectors()
	s := ss[len(ss)-1]
	return s
}
