---
title: "Printing Cue"
description: "How to print Cuelang values with fmt and Cue's builtin formatting."
weight: 10
---

In the last section, you may have noticed
we printed a Value with `fmt.Println`.
CUE Values support the `fmt.Printf` modifiers
and there is a builtin formatter for
fine grained controls.

### Printing with go/fmt

{{< codePane2 
	file1="code/go-api/basics/print.go" title1="print.go" lang1="go"
	file2="code/go-api/basics/print.html"  title2="go run print.go"
>}}

### Printing with cue/format

When we run `cue eval` and `cue def`,
we have more options to control what gets printed through the flags.
Those flags map onto the `cue.Option` type which is
supplied to `cue.Value.Syntax`, a function that returns the
Abstract Syntax Tree (AST) for the value.
We then use Cue's `format.Node` to pretty print a Cue AST.

{{< codePane2 
	file1="code/go-api/basics/format.go" title1="format.go" lang1="go"
	file2="code/go-api/basics/format.html"  title2="go run format.go"
>}}

##### Links:
###### {{< cuedoc page="/cue#Value.Syntax" >}}cue.Value.Syntax{{</cuedoc>}} - function for returning AST
###### {{< cuedoc page="/cue#Option" >}}cue.Option{{</cuedoc>}} - options for Syntax (and other funcs)
###### {{< cuedoc page="/cue/format" >}}cue/format.Node{{</cuedoc>}} - function for pretty-printing an AST

