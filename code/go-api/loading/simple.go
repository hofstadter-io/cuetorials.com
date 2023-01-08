package main

import (
	"fmt"

	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	// We need a cue.Context for building after loading
	ctx := cuecontext.New()

	// The entrypoints are the same as the files you'd specify at the command line
	entrypoints := []string{"hello.cue"}

	// Load Cue files into Cue build.Instances slice
	// the second arg is a configuration object, we'll see this later
	bis := load.Instances(entrypoints, nil)

	// Loop over the instances, typically there is only one
	for _, bi := range bis {
		// check for errors on the instance
		// these are typically parsing errors
		if bi.Err != nil {
			fmt.Println("Error during load:", bi.Err)
			continue
		}

		// Use cue.Context.BuildInstance to turn
		// a build.Instance into a cue.Value
		value := ctx.BuildInstance(bi)
		if value.Err() != nil {
			fmt.Println("Error during build:", value.Err())
			continue
		}

		// Validate the value
		err := value.Validate()
		if err != nil {
			fmt.Println("Error during validation:", err)
			continue
		}

		// Print the value
		fmt.Println("value:", value)
	}
}
