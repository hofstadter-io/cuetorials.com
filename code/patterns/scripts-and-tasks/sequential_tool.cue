package sequential

import "list"
import "tool/cli"

command: print: {
  for i, _ in list.Range(0,5,1) {
    "p\(i)": cli.Print & {
      // enforce dependencies between consecutive tasks
      if i > 0 {
        $dep: command.print["p\(i-1)"].$done
      }

      // input fields for the task
      text: "hello \(i)"
    }
  }
}

