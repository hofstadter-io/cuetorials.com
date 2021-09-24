---
title: "Closedness"
---

There are expected changes to how closedness works
in a number of cases and issues.

### Disallow non-hidden fields in closed structs

[Issue 543](https://github.com/cue-lang/cue/issues/543)

Currently, one can introduce a new definition into a closed struct.
The proposal would eliminate this.

The follow should result in an error.
Note that `#bar` is both an `int` and a `string` in `foo`.

{{< chromaHTML file="code/futurology/closedness/disallow-non-hidden.html">}}


