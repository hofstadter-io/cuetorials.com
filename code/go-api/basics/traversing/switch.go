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

	fmt.Println("obj:")
	iter, _ := val.Fields()
	for iter.Next() {
		printNodeType(iter.Value())
	}

	fmt.Println("\nsub:")
	val = val.LookupPath(cue.ParsePath("sub"))
	iter, _ = val.Fields()
	for iter.Next() {
		printNodeType(iter.Value())
	}

}

func printNodeType(val cue.Value) {
	switch val.IncompleteKind() {
	case cue.StructKind:
		fmt.Println("struct")

	case cue.ListKind:
		fmt.Println("list")

	default:
		printLeafType(val)
	}
}

func printLeafType(val cue.Value) {
	fmt.Println(val.IncompleteKind())
}
