---
title: "Open and Closedness"
description: "CUE's conepts of open and closed values"
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

### Templates and closedness

{{< codePane file="code/overview/closedness/template.html" title="template.cue" play="true">}}

### Extending definitions by embedding

{{< codePane file="code/overview/closedness/embed.html" title="embed.cue" play="true">}}

### Hidden fields in definitions

### List closedness

List open and closedness is much simpler than stucts and definitions.
When you use ellipses, the list is open.
Any fixed elements are required in the exact position.

{{< codePane file="code/overview/closedness/list.html" title="list.cue" play="true">}}



