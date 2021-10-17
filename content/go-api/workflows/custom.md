---
title: "Custom Workflow Tasks"
description: "Custom Tasks for Cue's workflow engine"
weight: 100
---

{{<lead>}}
Cue's scripting layer has a workflow engine that can build and run task graphs or DAGs.
The API allows you to leverage this workflow engine with your own tasks.
It will automatically detect dependencies between tasks for you
based on how fields and values are used.
{{</lead>}}

You will need to implement

- the `TaskFunc` interface which turns values into `flow.Runner`
- the `RunnerFunc` is the interface for custom tasks

You can find the {{<cuedoc page="/tool/flow">}}workflow godocs here{{</cuedoc>}}.

{{< chromaCode file="code/go-api/flow/custom.go" lang="go" title="custom.go" >}}

#### `go run custom.go`

{{< chromaCode file="code/go-api/flow/custom.out" lang="shell" title="output" >}}
