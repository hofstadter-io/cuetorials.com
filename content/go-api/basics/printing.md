---
title: "Formatting Cue"
description: "Printing Cue with formatting"
weight: 10
---

In the last section, we printed Cue using
the default options and `fmt.Println`.
When we run `cue eval` and `cue def`,
we have more options to control what gets displayed.
The options which match the flags are supplied
to `cue.Value.Syntx` and gives us back the
Abstract Syntax Tree (AST) for the value.
We then use Cue's format package which allows us to
pretty print a Cue AST.

##### Links:
###### {{< cuedoc page="/cue#Value.Syntax" >}}cue.Value.Syntax{{</cuedoc>}} - cue.Value function for returning AST
###### {{< cuedoc page="/cue#Option" >}}cue.Option{{</cuedoc>}} - options for Syntax (and other funcs)
###### {{< cuedoc page="/cue/format" >}}cue/format.Node{{</cuedoc>}} - function for pretty-printing an AST

<br>

### Pretty printing Cue values

This first example shows how to load, build, and validate Cue.

{{< codePane2 
	file1="code/go-api/format.go" title1="code/go-api/format.go" lang1="go"
	file2="code/go-api/format.html"  title2="code/go-api/format.cue"
>}}




