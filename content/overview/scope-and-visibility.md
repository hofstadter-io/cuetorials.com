---
title: "Scopes and Visibility"
description: "Cue's scope and visibility rules"
weight: 20
---

### Reference Lookup

Cue will reference a value from the nearest enclosing scope.
Some quirks are:

- fields without quotes you can reference as identifiers and with dot notation
- fields with quotes require index notation
- fields defined across scopes require sufficient paths to resolve

{{< codePane file="code/overview/scope-and-visibility/lookup.html" title="lookup.cue" play="true" >}}

### Aliases

An alias defines a local value which is not part of the struct.
They can be used for accessing shadowed fields, 
naming intermediate calculations or expressions,
and more. They will not be output.

{{< codePane file="code/overview/scope-and-visibility/alias.html" title="alias.cue" play="true">}}

### Paths

As we've seen, there are a few ways to access nested values.

{{< codePane file="code/overview/scope-and-visibility/paths.html" title="paths.cue" play="true">}}


### Hidden Fields and Values

Hidden fields and values are prefixed with underscores.
You can reference them in the current package and optionally
show them when evaluating. Use quotes if you want a real label that begins with an underscore.

_note, hidden output appears (no pun intended) to be broken in v0.3.0-alpha6_

{{< codePane3
  file1="code/overview/scope-and-visibility/hidden.html"     title1="hidden.cue" play1="true"
  file2="code/overview/scope-and-visibility/hidden-out.html" title2="cue eval hidden.cue"
  file3="code/overview/scope-and-visibility/hidden-viz.html" title3="cue eval -H hidden.cue"
>}}


### Reference Cycles

Cue can resolve many cycles, as long as they resolve to a final, concrete value.


{{< codePane file="code/overview/scope-and-visibility/ref-cycle.html" title="ref-cycle.cue" play="true">}}


### Structural Cycles

Structural cycles and recursion are not allowed in Cue.
We can define infinite structures as long as the data is finite.

{{< codePane file="code/overview/scope-and-visibility/structural.html" title="structural.cue" play="true">}}

