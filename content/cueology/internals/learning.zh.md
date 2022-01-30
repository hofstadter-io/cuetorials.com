---
title: "学习内部原理"
description: "学习 CUE 内部原理的建议"
weight: 50
---


### 学习 CUE 内部工作原理的提示

最重要的部分是求值器，在 

- `internal/core/{eval,adt}`

包括的事项：

- 顶级 struct
- 顶级 function
- 在求值过程中的数据结构
- 它们的关联

#### 之前的步骤

(v0.3.0-alpha)

Was experiencing slowdowns in `hof gen` with the new evaluator

- add pprof with CUE_PPROF
- find go's memory system is heavy
- filter for cue's functions mainly involved
- find cycle around 5-6 functions in the evaluator system
- use delve to start following a simple eval, didn't get very deep
- switch to printf to see high level flow
- start trying to find entry into evaluator, many new context (repeated prints)
- ... where is the entry point to this one file's evaluation?
- ... Validate() from setting breakpoint in delve (for NEW CONTEXT) and checking backtrace
- ... set breakpoint at cue.Value.Validate()
