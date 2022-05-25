package scripts

import "tool/exec"

import "tool/file"

command: enforced: {
	mkdir: file.MkdirAll & {
		path: "out/write/"
	}

	write: file.Create & {
		$dep:     mkdir.$done //  explicit dependency 
		filename: "out/write/foo.txt"
		contents: "hello world"
	}

	clean: exec.Run & {
		$dep: write.$done //  explicit dependency 
		cmd:  "rm -rf ./out"
	}
}
