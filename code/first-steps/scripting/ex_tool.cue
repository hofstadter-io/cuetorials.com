package foo

import (
	"tool/cli"
	"tool/exec"
	"tool/file"
)

// moved to the data.cue file to show how we can reference "pure" Cue files
// city: "Amsterdam"

// A command named "prompter"
command: prompter: {

	// save transcript to this file
	var: {
		file: *"out.txt" | string @tag(file)
	} // you can use "-t flag=filename.txt" to change the output file, see "cue help injection" for more details

	// prompt the user for some input
	ask: cli.Ask & {
		prompt:   "What is your name?"
		response: string
	}

	// run an external command, starts after ask
	echo: exec.Run & {
		// note the reference to ask and city here
		cmd: ["echo", "Hello", ask.response + "!", "Have you been to", city + "?"]
		stdout: string // capture stdout, don't print to the terminal
	}

	// append to a file, starts after echo
	append: file.Append & {
		filename: var.file
		contents: echo.stdout // becuase we reference the echo task
	}

	// also starts after echo, and concurrently with append
	print: cli.Print & {
		text: echo.stdout // write the output to the terminal since we captured it previously
	}
}
