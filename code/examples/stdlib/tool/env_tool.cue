package main

import (
	"tool/cli"
	"tool/os"
)

command: do: {
	env: os.Getenv & {
		USER: string
	}

	out: cli.Print & {
		text: "USER: \(env.USER)"
	}
}
