package args_tool

import "tool/cli"

args: {
	msg: string | *"hello world" @tag(msg)
}

command: print: cli.Print & {
	text: args.msg
}
