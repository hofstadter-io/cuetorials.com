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


### Selectors and MakePath

We saw how to use `LookupPath` with `ParsePath` in a previous section.
We can programmatically construct paths with `Selectors` and `MakePath`.
We'll also use this to reconstruct the label for the current value.

{{< codePane2
	file1="code/go-api/basics/traversing/selectors.go"  lang1="go"  title1="selectors.go"
	file2="code/go-api/basics/traversing/selectors.txt" lang2="txt" title2="go run selectors.go"
>}}

Docs:
[MakePath](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#MakePath),
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
[Fields](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Fields),
[Options](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Option)

### Type Switching

You will likely want to make choices based on the type of a value.
Use a switch statement on `val.IncompleteKind()`.

{{< codePane2
	file1="code/go-api/basics/traversing/switch.go"  lang1="go"  title1="switch.go"
	file2="code/go-api/basics/traversing/switch.txt" lang2="txt" title2="go run switch.go"
>}}

### Walking a Value

{{< codePane2
	file1="code/go-api/basics/traversing/walk.go"  lang1="go"  title1="walk.go"
	file2="code/go-api/basics/traversing/walk.txt" lang2="txt" title2="go run walk.go"
>}}

Docs:
[Walk](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Walk)

### Custom Walk

In the previous example for default walk, some of the fields were not traversed.
This is because CUE's default `Walk()` uses the same default `Field()` options on a value.
In order to walk all fields, we need to write a custom walk function
where we can pass in the options for `Field()`.

{{< codePane2
	file1="code/go-api/basics/traversing/custom.go"  lang1="go"  title1="custom.go"
	file2="code/go-api/basics/traversing/custom.txt" lang2="txt" title2="go run custom.go"
>}}

