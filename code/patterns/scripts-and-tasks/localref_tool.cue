package scripts

import "tool/cli"
import "tool/file"

// get a list of files
locallist: file.Glob & {
  glob: "*.cue"
}

command: localref: {

  list: locallist

  // comprehend tasks for each file, also an inferred dependency
  for _, filepath in list.files {
    (filepath): print: cli.Print & {
      text: filepath  // an inferred dependency
    }
  }

}
