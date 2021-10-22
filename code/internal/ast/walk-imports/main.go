package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/load"
)

func main() {
	// We need a Cue.Runtime, the zero value is ready to use
	var RT cue.Runtime

	// The entrypoints are the same as the files you'd specify at the command line
	entrypoints := []string{"a.cue", "b/b.cue"}

	// Load Cue files into Cue build.Instances slice
	// the second arg is a configuration object, we'll see this later
	bis := load.Instances(entrypoints, nil)

	// Loop over the instances, checking for errors and printing
	for _, bi := range bis {
		// check for errors on the instance
		// these are typically parsing errors
		if bi.Err != nil {
			fmt.Println("Error during load:", bi.Err)
			continue
		}

		// Use cue.Runtime to build.Instance to cue.INstance
		I, err := RT.Build(bi)
		if err != nil {
			fmt.Println("Error during build:", bi.Err)
			continue
		}

		// get the root value
		value := I.Value()

		// Validate the value
		err = value.Validate()
		if err != nil {
			fmt.Println("Error during validate:", err)
			continue
		}

		// Generate an AST
		//   try out different options
		syn := value.Syntax(
			cue.Final(),
			cue.Concrete(false), // allow incomplete values
			cue.Definitions(false),
			cue.Hidden(true),
			cue.Optional(true),
			cue.Attributes(true),
			cue.Docs(true),
		)

		// Pretty print the AST, returns ([]byte, error)
		bs, err := format.Node(
			syn,
			format.TabIndent(false),
			format.UseSpaces(2),
			// format.Simplify(),
		)
		if err != nil {
			fmt.Println("Error during format:", err)
			continue
		}

		fmt.Println(string(bs))
	}

}
