---
title: "CUE's cli commands"
description: "An overview of CUE's cli commands"
weight: 23
---

{{<lead>}}
This section provides a brief overview of CUE's cli
commands and their usage.
We will be using many of these throughout and
you will find links to the more in depth topics.
{{</lead>}}



### Main commands

These are the most common commands used from the `cue` cli.

##### `cue def`

Prints a consolidated representation of your code.
Useful for seeing what the evaluator sees before running.

##### `cue eval` 

The eval command evaluates, validates, and prints a configuration.
It can show the evaluated code and more with various flags.

##### `cue export`

Evaluates and emits configuration from the arguments.
It is typically used to generate Yaml and JSON from CUE
for other tools.

##### `cue vet`

Validates data with schemas.
Use __-c__ to ensure concrete values, __-d__ to select a schema,
and file globs to process multiple files.


### Import

Import refers to bringing external resources into CUE.

- `cue import` turns various data formats to CUE
- `cue get go` generates CUE from Go types

See
[first-steps/import-configuration](/first-steps/import-configuration/)
for more details.


### Modules

`cue mod` only has `init` today.
Eventually it will be something
that closely aligns with `go mod`.

See 
[first-steps/modules-and-packages](/first-steps/modules-and-packages/)
and
[futurology/dependency-management](/futurology/dependency-management)
for more details.


### Scripting

`cue cmd` is how commands in the tooling layer are invoked.
You can run `cue cmd <name>` or `cue <name>` as long as
there is not a conflict with any official commands.

See [first-steps/scripting](/first-steps/scripting/)
for more details.


### Utilities

- `cue version` information
- `cue fmt` for standardized and consistent code
- `cue completion` for bash, zsh, fish, and powershell
- `cue fix` for syntax fixes and rewriting
- `cue trim` reduces data redundancy base on schemas


### Help

While there is of course `cue help` for all of the commands,
you can find additional information with the `help topics`
which span the cli.

```
Additional help topics:
  cue commands   user-defined commands
  cue filetypes  supported file types and qualifiers
  cue flags      common flags for composing packages
  cue injection  inject files or values into specific fields for a build
  cue inputs     package list, patterns, and files
```

You can also supply the __-h__ flag on any command to learn more.

