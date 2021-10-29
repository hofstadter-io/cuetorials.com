---
title: "Loading Cue"
description: "How to load Cue files"
weight: 5
---


### Loading and printing Cue code

This first example shows how to load, build, and validate Cue.

{{< codePane3
	file1="code/go-api/loading/simple.go"  title1="simple.go" lang1="go" 
	file2="code/go-api/loading/hello.html" title2="hello.cue"
	file3="code/go-api/loading/simple.txt" title3="go run fields.go" lang3="txt" 
>}}

<br>

### The Loading Configuration

Cue's `load.Instances` has a second argument for configuring options.
The CLI, it uses the command, flags, and args to set these values.
When we load with Go, we can setup this `Config` object to modify the behavior.

{{< cuedoc page="/cue/load#Config" >}}load.Config documentation{{</cuedoc>}}

The comments there explain how to use the various options.
Most are for advanced use cases and will make more sense
once you have seen more of Cue.
Others you have seen as flags to the CLI.

