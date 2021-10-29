---
title: "The CUE Context"
description: "Overview for to use the Cuelang Context to compile CUE using the Go API"
weight: 5
keywords:
- go
- golang
- api
- context
- cuecontext
- compiling
- encoding
---

{{<lead>}}
Working with CUE from Go starts with `cue.Context`.
Code is compiled and values are built using a context.
You will see the basic methods for `cue.Context` here
and later pages will increase the sophistication.
{{</lead>}}

_When working with multiple values, they should come from the same runtime.
This requirement will be removed in a future version._



### Compiling with Context

This is the simplest program to print a CUE value.
It will print the first error message if you have one.

{{< codePane2
	file1="code/go-api/basics/context/context.go" lang1="go" title1="context.go"
	file2="code/go-api/basics/context/context.html"  title2="go run context.go"
>}}


### Compiling with a Scope

If you have schemas in one string and values in another,
you can use the `cue.Scope` option to provide a "context" for the `cue.Context`.

{{< codePane2
	file1="code/go-api/basics/context/scope.go" lang1="go" title1="scope.go"
	file2="code/go-api/basics/context/scope.html"  title2="go run scope.go"
>}}

### Encoding Values from Go

You can also transform your Go types and values into CUE values.
We can control the output with struct tags. Note that

- Only public members will be encoded by CUE.
- We can use `omitempty` to prevent output, but this impacts the type encoding as well.
- Numerical types have some quirks we'll talk about later. CUE normally uses `math/big` types.
- Details can be found in the [pkg.go.dev cue.Context.Encode docs](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Context.Encode).

{{< codePane2
	file1="code/go-api/basics/context/encoding.go" lang1="go" title1="encoding.go"
	file2="code/go-api/basics/context/encoding.html"  title2="go run encoding.go"
>}}

