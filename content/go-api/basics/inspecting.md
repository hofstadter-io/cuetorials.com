---
title: "Inspecting Values"
description: ""
keywords:
- go
- golang
- api
weight: 60
---

{{<lead>}}
CUE values have a number of methods that we can use
to inspect their contents, state, and location.
While we saw how to print the full value and its error state,
the functions here provide more granular details.
{{</lead>}}


We will be using the following CUE file
for the examples in this section.

{{< codePane
	file="code/go-api/basics/inspecting/value.html" title="value.cue"
>}}

### LookupPath, Path

`Path` return paths to the value
which can be used with `LookupPath` to get the value.
They can be considered inverse functions of each other.

{{< codePane2
	file1="code/go-api/basics/inspecting/path.go"  lang1="go"  title1="path.go"
	file2="code/go-api/basics/inspecting/path.txt" lang2="txt" title2="go run path.go"
>}}

Docs:
[LookupPath](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.LookupPath),
[Path](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Path)


### ReferencePath and Dereference

`ReferencePath` 

{{< codePane2
	file1="code/go-api/basics/inspecting/reference.go"  lang1="go"  title1="reference.go"
	file2="code/go-api/basics/inspecting/reference.txt" lang2="txt" title2="go run reference.go"
>}}

Docs:
[ReferencePath](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.ReferencePath),
[Dereference](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Dereference)

### Exists and IsConcrete

When you lookup a value, how do you know if it was found?
That is where `Exists` comes in.

`IsConcrete` can tell you if an atom field has data or is a terminal error.
For lists and structs, it will report true if they exist and not recurse to check subvalues.
When disjunctions and defaults are used...

{{< codePane2
	file1="code/go-api/basics/inspecting/exists.go"  lang1="go"  title1="exists.go"
	file2="code/go-api/basics/inspecting/exists.txt" lang2="txt" title2="go run exists.go"
>}}

Use `Validate` to check complete values for concreteness.

Docs:
[Exists](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Exists),
[IsConcrete](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.IsConcrete)



### Kind and IncompleteKind

Kind and IncompleteKind will tell you the underlying type of a value.
IncompleteKind is more granular and returns type info regarless of how complete a value is
(the names may seem a bit backwards).

{{< codePane2
	file1="code/go-api/basics/inspecting/kind.go"  lang1="go"  title1="kind.go"
	file2="code/go-api/basics/inspecting/kind.txt" lang2="txt" title2="go run kind.go"
>}}

You can also switch on the results of both functions.

Docs:
[Kinds](https://pkg.go.dev/cuelang.org/go@v0.4.0/internal/core/adt#Kind),
[Kind](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Kind),
[IncompleteKind](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.IncompleteKind)

### Type Conversions

Values have a number of functions for turning the abstract into the underlying type.
You will first want to know what type of value you are dealing with before trying to convert it.

{{< codePane2
	file1="code/go-api/basics/inspecting/conversions.go"  lang1="go"  title1="conversions.go"
	file2="code/go-api/basics/inspecting/conversions.txt" lang2="txt" title2="go run conversions.go"
>}}

### Len

`Len` will tell you the length of a list or how many bytes are in a bytes.

{{< codePane2
	file1="code/go-api/basics/inspecting/length.go"  lang1="go"  title1="length.go"
	file2="code/go-api/basics/inspecting/length.txt" lang2="txt" title2="go run length.go"
>}}

Docs:
[Len](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Len)

