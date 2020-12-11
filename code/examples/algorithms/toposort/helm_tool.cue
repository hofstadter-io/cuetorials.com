package helm

import (
	"strings"

	"encoding/yaml"
	"tool/cli"
)

elems: [for _, O in order { yaml.Marshal(O) }]
out: strings.Join(elems, "\n---\n")

command: hello: {
	print: cli.Print & {
		text: "hello"
	}
}

command: order: {
	print: cli.Print & {
		text: out
	}
}
