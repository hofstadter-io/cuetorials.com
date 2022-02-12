package scripts

import "tool/cli"
import "tool/file"

command: autodep: {
  read: file.Read & {
    filename: "data.json"
    contents: string
  }

  print: cli.Print & {
    text: read.contents  // an inferred dependency
  }
}
