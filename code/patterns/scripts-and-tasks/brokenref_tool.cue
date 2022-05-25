package scripts

import "tool/cli"

import "tool/file"

// get a list of files
locallist: file.Glob & {
	glob: "*.cue"
}

command: brokenref: {

	// comprehend tasks for each file, also an inferred dependency
	for _, filepath in locallist.files {
		(filepath): print: cli.Print & {
			text: filepath // an inferred dependency
		}
	}

}
