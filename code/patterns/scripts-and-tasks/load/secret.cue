// This flow gets an api code with OAuth workflow
package load

import (
  "encoding/json"

  "hof.io/example/utils"
)

meta: {
  vars: {
    // import a reusable task
    RR: utils.RepoRoot  // localized dependency
    root: RR.Out        // inferred dependency
    fn: "\(root)/code/patterns/scripts-and-tasks/data.json"
  }
}

load: {
  cfg: meta  // localized dependency

  read: {
    $id: "tool/file.Read"
    filename: cfg.vars.fn  // inferred dependency
    contents: string
  }

  data: json.Unmarshal(read.contents)
  say: data.cow

  print: {
    $id: "tool/cli.Print"
    text: read.contents    // inferred dependency
  }
}
