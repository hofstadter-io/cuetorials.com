---
title: "Learning the internals"
description: "Helpful suggestions for learning Cue's internals"
weight: 50
---
## Notes on learning how Cue works internally

The main logical piece is the evaluator.
This is..

- `internal/core/{eval,adt}`

Things to cover:

- top level structs
- top level functions
- what the data structs look like during evaluation
- how they relate

#### Early steps

(v0.3.0-alpha)

Was experiencing slowdowns in `hof gen`
with the new evaluator

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
