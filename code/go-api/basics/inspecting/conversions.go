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

	var (
		s string
		b []byte
		i int64
		f float64
	)

	// read into Go basic types
	s, _ = val.LookupPath(cue.ParsePath("a.b")).String()
	b, _ = val.LookupPath(cue.ParsePath("b")).Bytes()
	i, _ = val.LookupPath(cue.ParsePath("d.e")).Int64()
	f, _ = val.LookupPath(cue.ParsePath("d.f")).Float64()

	fmt.Println(s, b, i, f)

	// an error
	s, err := val.LookupPath(cue.ParsePath("a.e")).String()
	if err != nil {
		fmt.Println(err)
	}

}
