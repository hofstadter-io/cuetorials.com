package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/load"
)

func main() {
	// We need a Cue.Runtime, the zero value is ready to use
	var RT cue.Runtime

	// The entrypoints are the same as the files you'd specify at the command line
	entrypoints := []string{"hello.cue"}

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

		// get the root value and print it
		value := I.Value()
		fmt.Println("root value:", value)

		// Validate the value
		err = value.Validate()
		if err != nil {
			fmt.Println("Error during validate:", err)
			continue
		}
	}

}
