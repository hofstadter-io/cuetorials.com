---
title: "Transforms"
description: "Transforms are a pattern for taking inputs and producing outputs with a definition"
weight: 10
---

### Cue "functions"

You can use Cue definitions or structs to create function like objects.
It is typical to have an input and output schema, and then you are free
to do whatever else you like in between them.

{{< chromaHTML file="code/patterns/transforms/function.html" title="function.cue" >}}

```shell
$ cue eval function.cue -e loudly
in: {
    count: 3
    msg:   "ra"
}
out: {
    val: "RA RA RA"
}
```



