package gen

import (
	"tool/file"
)

command: "gen-todos": {
	for i, R in gen.rendered {
		// make a unique name when comprehending
		"write-\(i)": file.Create & {
			filename: R.filename
			contents: R.contents
		}
	}
}
