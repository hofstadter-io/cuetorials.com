package scripts

import "tool/file"

command: unenforced: {
	mkdir: file.MkdirAll & {
		path: "out/write/"
	}

	write: file.Create & {
		filename: "out/write/foo.txt"
		contents: "hello world"
	}
}
