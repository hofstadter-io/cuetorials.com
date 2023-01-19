---
title: Configuration
weight: 10
---

{{<lead>}}
Cue's `load.Instances` has a second argument to configure loading behavior.
The `cue` CLI fills this type from the command and flags.
When loading CUE with Go, we often need to setup this `Config` as well.
{{</lead>}}


### The Config Type

The `load.Config` type allows you to control the loading process.
To highlight the important parts, we have:

- reduced some of the comments
- removed deprecated fields
- removed advanced or rarely used fields

See the {{< cuedoc page="/cue/load#Config" >}}load.Config{{</cuedoc>}} documentation
for complete details.

{{< codePane file="code/go-api/loading/config.go" title="cue/load.Config Type" lang="go" >}}

### Field Overview

The following will hopefully connect some of
the Config fields to the `cue` CLI options.
The more advanced fields will be covered after with dedicated pages.

- `Dir` is working directory for the loader, equivalent to where you run the `cue` tool
- `ModuleRoot` is the top-level directory for the CUE module, equivalent to where the `cue.mod` directory is found
- `Module` is the module name to use, equivalent to the value in `cue.mod/module.cue`
- `Package` is the -p / --package flag used when running the `cue` tool
- `Tags` is -t / --inject flags used when running the `cue` tool
- `TagVars` are tags provided with predefined values.
  The {{< cuedoc page="/cue/load#DefaultTagVars" >}}load.DefaultTagVars function{{</cuedoc>}} provides the same as `cue -T`.
  You can also add or provide your own predefined values using the `TagVars` field.

{{< codePane file="code/go-api/loading/tagvars.txt" title="Default TagVars" lang="txt" >}}
{{< codePane file="code/go-api/loading/tagvars.html" title="tagvars.cue" >}}
