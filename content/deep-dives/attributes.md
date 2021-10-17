---
title: "Attributes"
description: "Cuelang Attributes are markup used by CUE and tools written in Go."
brief: "CUE markup for use by tools"
weight: 10
---

{{<lead>}}
Attributes are a form of markup in CUE intended for tools building on Cuelang.
The `cue` tool has several reserved attributes and you can
make your own attributes with their own meanings.
{{</lead>}}

<br />
### Overview

Attributes are added to fields and structs as a form of markup.
They are not processed during evaluation, only tracked like comments.
Nor are they accessible from within CUE and require you
to write Go to work with them.

Despite being simple markup, attributes offer
significant flexibility and configurability
for custom Go tools.
You can assign any meaning or behavior to them
as they are only interpretable by your applications.

Attributes have the following syntax:

- start with `@`, have a label, and parentheses
- appear after fields or in structs
- can have comma separated keys with optional values
- values are strings and can have any format you wish


{{< codePane file="code/deep-dives/attributes/format.html" title="format.cue">}}


propegation...

- only declaration attributes
- through unification and imports(?)


<br />
### `cue`'s attributes

The `cue` tool has several predefined attributes.

- `@tag()`
- `@if()`
- `@go()`
- `@protobuf()`


<br />
### Custom attributes


