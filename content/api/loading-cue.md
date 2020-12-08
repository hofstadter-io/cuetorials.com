---
title: "Loading Cue"
description: "How to load Cue files"
weight: 5
---


### Loading and printing Cue code

This first example shows how to load, build, and validate Cue.

{{< chromaCode lang="go" title="code/api/loading.go" file="code/api/loading.go" >}}

{{< chromaHTML title="code/api/hello.cue" file="code/api/hello.html" >}}

<br>

### The Loading Configuration

Cue's `load.Instances` has a second argument for configuring options.
The CLI, it uses the command, flags, and args to set these values.
When we load with Go, we can setup this `Config` object to modify the behavior.

{{< cuedoc page="/cue/load#Config" >}}load.Config documentation{{</cuedoc>}}

The comments there explain how to use the vaious options.
Most are for advanced use cases and will make more sense
once you have seen more of Cue.
Others you have seen as flags to the CLI.

