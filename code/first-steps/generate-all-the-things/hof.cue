package gen

import (
	// import hof's generator schema
	"github.com/hofstadter-io/hof/schema/gen"
)

// A schema for our generator's input
#Input: {
	name: string
	todos: [...{
		name:     string
		effort:   int
		complete: bool
	}]
}

// create a generator
#Gen: gen.#HofGenerator & {
	// We often have some input values for the user to provide.
	// Use a Cue definition to enforce a schema
	Input: #Input

	// Required filed for generator definitions, details can be found in the hof docs
	PackageName: "dummy"

	// Required field for a generator to work, the list of files to generate
	Out: [...gen.#HofGeneratorFile] & [
		todo,
		done,
		debug,
	]

	// In is supplied as the root data object to every template
	// pass user inputs to the tempaltes here, possibly modified, enhanced, or transformed
	In: {
		INPUT:      Input
		Completed:  _C
		Incomplete: _I
	}

	// calculate some internal data from the input
	_C: [ for t in Input.todos if t.complete == true {t}]
	_I: [ for t in Input.todos if t.complete == false {t}]

	// the template files
	todo: {
		Template: """
			Hello {{ .INPUT.name }}.
			
			The items still on your todo list:

			{{ range $T := .Incomplete -}}
			{{ printf "%-4s%v" $T.name $T.effort }}
			{{ end }}
			"""
		// The output filename, using string interpolation
		Filepath: "\(Input.name)-todo.txt"
	}
	done: {
		Template: """
			Here's what you have finished {{ .INPUT.name }}. Good job!

			{{ range $T := .Completed -}}
			{{ $T.name }}
			{{ end }}
			"""
		Filepath: "\(Input.name)-done.txt"
	}

	// useful helper
	debug: {
		Template: """
			{{ yaml . }}
			"""
		Filepath: "debug.yaml"
	}
}

// Add the @gen(<name>,<name>,...) to denote usage of a generator
Gen: _ @gen(todos)
// Construct the generator
Gen: #Gen & {
	Input: {
		name:  "tasks"
		todos: [
			{name: "t1", effort: 1, complete: true},
			{name: "t2", effort: 4, complete: true},
			{name: "t3", effort: 3, complete: false},
			{name: "t4", effort: 2, complete: true},
			{name: "t5", effort: 3, complete: false},
		]
	}
}
