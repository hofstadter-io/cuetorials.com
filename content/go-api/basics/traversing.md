---
title: "Traversing Values"
description: "Learn how to iterate and walk Cuelang values."
keywords:
- go
- golang
- api
- iterate
- iteration
- custom
- walk
weight: 70
---

{{<lead>}}
There are several ways to traverse values
from looking up based on path to iteration and walking the value tree.
Some of these are configurable, which is tied to the different labels
like regular, hidden, optional, and definitions.
{{</lead>}}

### LookupPath

We've briefly seen `LookupPath` in previous sections.
Here we will see more examples and ways we can build
path values programatically.

{{< codePane2
	file1="code/go-api/basics/traversing/lookup.go"  lang1="go"  title1="lookup.go"
	file2="code/go-api/basics/traversing/lookup.txt" lang2="txt" title2="go run lookup.go"
>}}

Docs:
[LookupPath](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.LookupPath),
[Selectors](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Selector)

### List Iteration

{{< codePane2
	file1="code/go-api/basics/traversing/list.go"  lang1="go"  title1="list.go"
	file2="code/go-api/basics/traversing/list.txt" lang2="txt" title2="go run list.go"
>}}

Docs:
[List](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.List)

### Field Iteration

{{< codePane2
	file1="code/go-api/basics/traversing/fields.go"  lang1="go"  title1="fields.go"
	file2="code/go-api/basics/traversing/fields.txt" lang2="txt" title2="go run fields.go"
>}}

Docs:
[Fields](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Fields)

### Walking a Value

{{< codePane2
	file1="code/go-api/basics/traversing/walk.go"  lang1="go"  title1="walk.go"
	file2="code/go-api/basics/traversing/walk.txt" lang2="txt" title2="go run walk.go"
>}}

Docs:
[Walk](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Walk)

### Custom Walk

{{< codePane2
	file1="code/go-api/basics/traversing/custom.go"  lang1="go"  title1="custom.go"
	file2="code/go-api/basics/traversing/custom.txt" lang2="txt" title2="go run custom.go"
>}}

