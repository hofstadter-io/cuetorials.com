package scripts

import "tool/cli"
import "tool/file"

maxlen: 16

command: foreach: {

  // get a list of files
  list: file.Glob & {
    glob: "*.cue"
  }

  // comprehend tasks for each file, also an inferred dependency
  for _, filepath in list.files {
    // make a unique key for the tasks per item
    (filepath): {
      // and have locally referenced dependencies
      read: file.Read & {
        filename: filepath 
        contents: string
      }
      print: cli.Print & {
        text: read.contents  // an inferred dependency
      }
    }
  }
}

command: maybe: {
  // get a list of files
  list: file.Glob & {
    glob: "*.cue"
  }

  // comprehend tasks for each file, also an inferred dependency
  for _, filepath in list.files {
    // only print long names
    if len(filepath) > maxlen {
      (filepath): print: cli.Print & {
        text: filepath  // an inferred dependency
      }
    }
  }

}
