---
title: "Error Handling"
description: "Working with errors in Cuelang's Go API"
keywords:
- go
- golang
- api
- error
- handling
weight: 30
---

{{<lead>}}
CUE has its own error type which implements Go's error interface.
We can use the `cue/errors` package in order to unpack and print them.
{{</lead>}}

{{< codePane2
	file1="code/go-api/basics/errors/errors.go"  lang1="go"  title1="errors.go"
	file2="code/go-api/basics/errors/errors.txt" lang2="txt" title2="go run errors.go"
>}}

You can find more information on [pkg.go.dev cue/errors](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue/errors).

