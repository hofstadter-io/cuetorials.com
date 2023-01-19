---
title: "Loading CUE"
description: "How to Cuelang's loading system for more complex use cases."
weight: 20
---

{{<lead>}}
Loading CUE aims to mimic the process the CLI
uses to construct a value from entrypoints or arguments.
This section and subsections go over the loading process and configuration.
The next section deals with managing the the gaps and differences
to fully replicate the CLI behavior.
{{</lead>}}


### The Loading Process

The CUE loader or
{{<cuedoc page="/cue/load">}}cue/load{{</cuedoc>}} package
can be used to load CUE much like the CLI.
The process consists of:

1. specifying the entrypoints or arguments
2. setting up the configuration
3. calling {{< cuedoc page="/cue/load#Instances" >}}load.Instances{{</cuedoc>}}
4. turning or building the Instances into a CUE Value

We will first walk through a basic example of this process
then look at details and advanced usage.

{{<childpages>}}

### Loading and Printing CUE Code

This first example shows how to load and build CUE from entrypoints like the `cue` CLI commands.

{{< codePane3
	file1="code/go-api/loading/simple.go"  title1="simple.go" lang1="go" 
	file2="code/go-api/loading/hello.html" title2="hello.cue"
	file3="code/go-api/loading/simple.txt" title3="go run simple.go" lang3="txt" 
>}}


