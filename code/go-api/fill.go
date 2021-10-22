package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/load"
)

func main() {
	// We need a cue.Context, the New'd return is ready to use
	ctx := cuecontext.New()

	// The entrypoints are the same as the files you'd specify at the command line
	entrypoints := []string{"fill.cue"}

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

		// Use cue.Context to turn build.Instance to cue.Instance
		value := ctx.BuildInstance(bi)
		if value.Err() != nil {
			fmt.Println("Error during build:", value.Err())
			continue
		}

		// Validate the value
		err := value.Validate(
			cue.Final(),         // close structs and lists
			cue.Concrete(false), // allow incomplete values
		)
		if err != nil {
			fmt.Println("Error during validate:", err)
			continue
		}
		printVal(value)

		// A := value.Lookup("A")
		A := value.LookupDef("#A")
		printVal(A)
		B := value.Lookup("B")
		printVal(B)

		R := A.Fill(B, "a", "nested")
		if R.Err() != nil {
			fmt.Println("Error during fill:", R.Err())
			continue
		}

		U := R.Unify(A)
		if U.Err() != nil {
			fmt.Println("Error during unify:", U.Err())
			continue
		}

		// Generate an AST
		//   try out different options
		printVal(U)
	}

}

func printVal(val cue.Value) {
	syn := val.Syntax(
		cue.Final(),         // close structs and lists
		cue.Concrete(false), // allow incomplete values
		cue.Definitions(false),
		cue.Hidden(true),
		cue.Optional(true),
		cue.Attributes(true),
		cue.Docs(true),
	)

	// Pretty print the AST, returns ([]byte, error)
	bs, _ := format.Node(
		syn,
		format.TabIndent(false),
		format.UseSpaces(2),
	)
	fmt.Println(string(bs))
}
