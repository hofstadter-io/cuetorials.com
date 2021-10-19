---
title: "Attributes"
description: "Cuelang Attributes are markup used by CUE and tools written in Go."
brief: "CUE markup for use by tools"
weight: 10
---

{{<lead>}}
Attributes are a form of markup in CUE intended for tools building on Cuelang.
The `cue` tool has several reserved attributes
and you can make your own attributes with their own meanings.
{{</lead>}}

### Overview

Attributes are added to fields and structs as a form of markup.
They are not processed during evaluation, only tracked like comments.
Nor are they accessible from within CUE and require you
to write Go to work with them.

Despite being simple markup, attributes offer
significant flexibility and configurability
for custom Go tools.
They were originally added to help map between different
representations like Go and Protobug.
However, you can assign any meaning or behavior to them
as they are only interpretable by your applications.
In that sense they are a lot like Go struct tags, for the familiar.

Attributes have the following syntax:

- they start with `@`, have a label, and parentheses
- appear after fields or in structs
- can have comma separated keys with optional values
- values are strings and can have any format you wish


{{< codePane file="code/deep-dives/attributes/format.html" title="format.cue">}}


### `cue`'s attributes

The `cue` tool has several predefined attributes.
You can run `cue help injection` at the command line for quick reference.

##### `@tag()` is used for injecting data from the command line

You can use this capability to inject data and control the values which get evaluated. 

{{< codePane3
	file1="code/deep-dives/attributes/inject.html"      title1="inject.cue"
	file2="code/deep-dives/attributes/inject-dev.html"  title2="cue export inject.cue"
	file3="code/deep-dives/attributes/inject-prod.html" title3="cue export inject.cue -t env=prod"
>}}

Use the `type` option to set interpretation and `short` for commonly used values.

{{< codePane2
	file1="code/deep-dives/attributes/inject-type.html"  title1="cue eval -t val=3.14 inject-type.cue"
	file2="code/deep-dives/attributes/inject-short.html" title2="cue eval -t prod inject-short.cue"
>}}



##### `@if()` is used for including a file when a tag is present

Use this special built tag to include entire files in evaluation.

{{< codePane3
	file1="code/deep-dives/attributes/if-main.html" title1="if-main.cue"
	file2="code/deep-dives/attributes/if-qa.html"   title2="if-qa.cue"
	file3="code/deep-dives/attributes/if-prod.html" title3="if-prod.cue"
>}}

{{< codePane3
	file1="code/deep-dives/attributes/if-main-out.html" title1="cue eval ."
	file2="code/deep-dives/attributes/if-qa-out.html"   title2="cue eval -t qa ."
	file3="code/deep-dives/attributes/if-prod-out.html" title3="cue eval -t prod ."
>}}

##### `@go()` connect representations

CUE adds struct tags during Go code import.
Currently the following will be carried over (`[go,yaml,json,toml,xml,protobuf]`)

##### `@embed()` has been proposed for embedding other files into CUE

This would work similar to Go's embedding system.



### Propagation

There are rules for how attributes propagate
through unification, structural embedding, and imports.
This allows you to add attributes to a definition
and they will show up in the values.
You can also add to the attributes.

{{< codePane2
	file1="code/deep-dives/attributes/propagation-fields.html" title1="propagations-fields.cue"
	file2="code/deep-dives/attributes/propagation-fields-out.html" title2="cue eval -A propagation-fields.cue"
>}}

{{< codePane2
	file1="code/deep-dives/attributes/propagation-struct.html" title1="propagations-struct.cue"
	file2="code/deep-dives/attributes/propagation-struct-out.html" title2="cue eval -A propagation-struct.cue"
>}}


Field attributes do not propegate due to the following issue:

{{< codePane2
	file1="code/deep-dives/attributes/field-prop-issue.html" title1="field-propagation-issue.cue"
	file2="code/deep-dives/attributes/field-prop-issue-out.html" title2="cue eval -A field-propagation-issue.cue"
>}}


### Working with attributes

To work with attributes you have to write Go code.
`cue` does this for the predefined attributes.
See the [go-api/attributes](/go-api/attributes) section
for details and code snippets.

