---
title: "Open and Closedness"
description: "CUE's concepts of open and closed values"
weight: 22
---

{{<lead>}}
Closedness describes the state of a value in terms of extensibility.
In the simplest terms, a closed value cannot have fields added and an open value can.
There are a lot of rules for determining a Value's closed state
and some constructs define sets of fields.
So don't worry if it seems confusing at first, the implementation is even trickier!
{{</lead>}}

<br>


### Structs are open by default

Structs are open and extensible by default.
You can add fields through or after conjunction.
This applies recursively to all fields.

{{< codePane file="code/overview/closedness/struct.html" title="struct.cue" play="true" >}}

### Definitions are closed by default

Definitions have a fixed structure.
You can be sure no extra fields will be added.
This applies recursively to all fields.


{{< codePane file="code/overview/closedness/definition.html" title="definition.cue" play="true">}}

### Opening and closing values

You can open definitions with `...` and close structs with `close`.
These are not recursively applied, only changing the field they are used on.

{{< codePane file="code/overview/closedness/open-n-close.html" title="open-n-close.cue" play="true">}}

### Closedness with pattern constraints

Pattern constraints define a set of values. So while `d & #D` is closed,
it can still have an infinite number of labels defined.

{{< codePane file="code/overview/closedness/pattern-constraints.html" title="pattern-constraints.cue" play="true">}}

### Extending definitions by embedding

Embedding allows the extension of a definition while still
receiving updates when `#D` is changed.

{{< codePane file="code/overview/closedness/embed.html" title="embed.cue" play="true">}}

### Hidden fields

You can add hidden fields to a closed value. This works for both definitions
and structs which have been `close()`'d.

{{< codePane file="code/overview/closedness/hidden.html" title="hidden.cue" play="true">}}

### List closedness

List open and closedness is much simpler than structs and definitions.
When you use ellipses, the list is open.
Any fixed elements are required in the exact position.

{{< codePane file="code/overview/closedness/list.html" title="list.cue" play="true">}}



