---
title: "The Go Codec"
brief: ""
description: "Conversion, completion, and validation with Go and Cuelang"
keywords:
- go
- golang
- api
weight: 100
---

{{<cuedoc page="encoding/gocode/gocodec">}}encoding/gocode/gocodec{{</cuedoc>}} package documentation

This page has been put onhold until the package is updated to use `cue.Context` from the deprecated `cue.Runtime`.

[Issue to track Runtime -> Context for gocodec](https://github.com/cue-lang/cue/issues/1318)


### Encode

{{< codePane2
	file1="code/go-api/basics/gocodec/encode.go"  lang1="go"  title1="encode.go"
	file2="code/go-api/basics/gocodec/encode.txt" lang2="txt" title2="go run encode.go"
>}}

### Decode

{{< codePane2
	file1="code/go-api/basics/gocodec/decode.go"  lang1="go"  title1="decode.go"
	file2="code/go-api/basics/gocodec/decode.txt" lang2="txt" title2="go run decode.go"
>}}

### Extract

{{< codePane2
	file1="code/go-api/basics/gocodec/extract.go"  lang1="go"  title1="extract.go"
	file2="code/go-api/basics/gocodec/extract.txt" lang2="txt" title2="go run extract.go"
>}}

### Complete

{{< codePane2
	file1="code/go-api/basics/gocodec/complete.go"  lang1="go"  title1="complete.go"
	file2="code/go-api/basics/gocodec/complete.txt" lang2="txt" title2="go run complete.go"
>}}

### Validate

{{< codePane2
	file1="code/go-api/basics/gocodec/validate.go"  lang1="go"  title1="validate.go"
	file2="code/go-api/basics/gocodec/validate.txt" lang2="txt" title2="go run validate.go"
>}}

