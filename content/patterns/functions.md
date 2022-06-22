---
title: "The Function Pattern"
description: "Reusable transformations in CUE"
weight: 5
---



You can use Cue definitions or structs to create function like objects.
It is typical to have an input and output schema, and then you are free
to do whatever else you like in between them.

There is a proposal to simplify this pattern with official syntax.
See the beginning of the
[core builtin extensions](https://github.com/cue-lang/cue/issues/943)
for more details.



{{< codePane file="code/patterns/functions/function.html" title="function.cue" play="true" >}}

{{< codeInner title="cue eval function.cue -e result" >}}
in: {
    count: 3
    msg:   "ra"
}
out: {
    val: "RA RA RA"
}
{{< /codeInner >}}

