---
title: "Scripting with Cue"
description: "Scripting with Cue's tooling layer"
keywords:
- script
- scripting
- cue/tool
- tooling layer
weight: 60
---

Cue's evaluation model prevents you from changing values
and interacting with the outside world, where values can
change between runs. This is done to enforce consistency.
To work with the external world,
Cue has a tooling layer where you
can access the execute commands, read and write files, or make network calls.
(the list of "tools" can be [found here](https://pkg.go.dev/cuelang.org/go/pkg/tool))

To use this system, there are a couple of differences from regular cue:

- scripting files have a `_tool.cue` suffix
- commands are run with `cue cmd <name>`

You will also be able to use your "pure" Cue from these files,
but not the other way around (as this would break the rules).

- Cue explicitly prevents computation
- But we need to often combine these configurations and tasks in ops
- Cue scripting / workflow


### Example Script

This example is taken from the `cue help cmd` text
with some minor changes to the comments.

Tool files have a common format:

- `command: <name>: { ... }` are the commands you can call with `cue cmd`.
- Each command has a number of tasks `<task name>: <task type> & { ... }`. The task types come from the `tool/...` builtins.
- Task types have different fields, some are inputs and others are outputs
- Tasks will run concurrently by default. They will be ordered into a DAG if there are references to other tasks.

`ex_tool.cue` (run with `cue cmd prompter`)

{{< codePane file="code/first-steps/scripting/ex_tool.html" >}}


