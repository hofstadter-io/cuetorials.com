---
title: "自定义工作流任务"
description: "使用 Cue 的工作流引擎来自定义任务"
weight: 100
---

{{<lead>}}
CUE 的脚本层有一个工作流引擎，可以用于构建或执行任务图或 DAG。

它的 API 允许你在你自己的任务中使用这个工作流引擎。

它会根据字段和值的使用自动在任务中检测依赖。
{{</lead>}}

你需要实现：

- `TaskFunc` 接口，用于转换数据到 `flow.Runner` 
- `RunnerTask` 是自定义任务的接口

你可以在  {{<cuedoc page="/tools/flow">}}这里{{</cuedoc>}} 找到工作流的文档。

{{< codePane file="code/go-api/flow/custom.go" lang="go" title="custom.go" >}}

#### `go run custom.go`

{{< codePane file="code/go-api/flow/custom.out" lang="shell" title="output" >}}
