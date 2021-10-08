---
title: "Modules and Packages"
description: "Working with Cue modules and packages"
keywords:
- mod
- module
- package
- dependency
- management
- hof
- hofstadter
weight: 50
---

Cue has a module and package system like any proper language.
With modules and packages, you also have imports.
This is one of its most significant advantages over current configuration
languages like Yaml and JSON.
Cue's module system is very similar to Go's, but has it's differences.

- A module name has a particular format
    - `domain.com/name` is the minimal
    - `github.com/owner/repo` is common
    - imports without a domain are assumed to be builtins from the standard library
    - You don't actually need a domain or repository, it's just a path naming requirement
- You must create a file (`cue.mod/module.cue`) to signify a module
- Modules are comprised of packages, Cue supports multiple packages in a directory
- Only absolute imports are allowed, no relative imports (for security reasons)
- You can rename imported packages at the time of import (like the k8s.io imports previously seen)
- Definitions and Values in the same package can be accessed across files without imports

_While, Cue does not yet have a dependency management system, it will import and process them. See below for details._

### Defining a module

To define a module, we simply need to add a `cue.mod/module.cue` file.
Before you do, you will _not_ be able to import files from other directories or modules.

{{< codePane file="code/first-steps/modules-and-packages/listing.txt" title="file listing" lang="shell">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/module.html" title="cue.mod/module.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/root.html" title="root.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/a/a.html" title="a/a.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/bar.html" title="cue.mod/pkg/github.com/foo/bar/bar.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/b/b.html" title="cue.mod/pkg/github.com/foo/bar/b/b.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/multi/hello.html" title="cue.mod/pkg/github.com/foo/bar/multi/hello.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/multi/world.html" title="cue.mod/pkg/github.com/foo/bar/multi/world.cue">}}

When we run this, we can see the output by combining the modules and pacakges

{{< codePane file="code/first-steps/modules-and-packages/eval.html" title="cue eval root.cue">}}


<br>

### Dependency management

Cue dependencies are located in the `cue.mod/pkg/...` directory.
From here, dependent modules are nested under directories mirroring their import path.

```text
cue.mod
├── module.cue
└── pkg
    └── github.com
        ├── foo
        │   └── bar
        └── hofstadter-io
            ├── hof
            ├── hofmod-cli
            └── hofmod-server
```

Cue does not yet have a dependency management system. You have to get them in place another way.
([Open issue](https://github.com/cuelang/cue/issues/409))

Fortunately, Hofstadter has built a generalized dependency management system as part of our `hof` tool,
based on `go mod` and Minimum Version Selection (MVS).
While it does not have all of the automation of a `go mod` solution, but should help you out unitl Cue has its own.

First, you will need to initialize a module

`hof mod init cue github.com/hofstadter-io/cuetorials` will setup both the `cue.mods` file and the `cue.mod/module.cue` file.

The format for `cue.mods` looks like Go's.

{{<codeInner title="cue.mods">}}
// this should match the cue.mod/modules.cue value
module "github.com/hofstadter-io/cuetorials"

cue = master // or another version, not really used but a required field

require (
  domain.com/owner/repo v0.1.2    // select a version
  domain.com/other/repo v0.0.0    // latest version
)

replace github.com/other/repo => github.com/myorg/repo  // replace with a different remote repository
replace github.com/hof/studios => ../../studios         // local replace
{{< /codeInner >}}

`hof` will not inspect your code to determine dependencies, thus you have to __always__ manually add them.

When you add or change dependencies, or change the code in a local replace, run the following command
to fetch them to your modules "vendor" directory (cue.mod/pkg)

```sh
hof mod vendor cue
```

`hof` will fetch, cache, and update your dependencies using the MVS algorithm.
You will now be able to import from both the dependencies and local directories to your module.
If you only want local imports, you don't need

You can learn more about Hofstadter and our `hof` tool at https://docs.hofstadter.io

We also have several modules available on GitHub (https://github.com/hofstadter-io)
using the `hofmod-` prefix. These are designed for our code generation framework,
discussed in the final section of "first-steps".

