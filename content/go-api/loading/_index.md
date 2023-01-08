---
title: "Loading CUE"
description: "How to Cuelang's loading system for more complex use cases."
weight: 20
---

{{<lead>}}
Loading CUE aims to mimic the process the CLI
uses to construct a value from entrypoints or arguments.
This section and subsections go over the loading process and configuration.
The next section deals with managing the the gaps and differences.
{{</lead>}}


### The Loading Process

The CUE loader or
{{<cuedoc page="cue/load">}}cue/load{{</cuedoc>}} package
can be used to load CUE much like the CLI.
The process consists of:

1. specifying the entrypoints or arguments
2. setting up the configuration
3. calling {{< cuedoc page="/cue/load#Instances" >}}load.Instances{{</cuedoc>}}
4. turning or building the Instances into a CUE Value

We will first walk through a basic example of this process
and then look at the details and advanced usage.

{{<childpages>}}
