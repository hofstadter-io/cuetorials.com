---
title: "The CUE Context"
description: "Overview for to use the Cuelang Context to compile CUE using the Go API"
weight: 5
---

Working with CUE from Go starts with `cue.Context`.
Values are built and code compiled using this context.
When working with multiple values, they should come from the same runtime. 
_Note, this requirement will be removed in a future version._

{{< codePane file="code/go-api/basics/context.go" lang="go" title="context.go">}}

{{<codeInner lang="shell">}}
$ go run context.go
{
        i:   int
        foo: "bar"
}
{{</codeInner>}}
