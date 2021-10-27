---
title: "Field Patterns"
description: "Patterns around struct fields"
weight: 3
---

{{<lead>}}
There are a number of patterns which allow us
to add complexity to field constraints and validation.
{{</lead>}}


### OneOf

The OneOf pattern is used to enforce one and only one of a set of fields.
We use disjunctions and an embedding to create this behavior.

{{< codePane
  file="code/patterns/fields/oneOf.html" title="oneOf.cue" play="true"
>}}

You can also have more options and an empty option
if you want to allow none of them to be valid as well.

{{< codePane
  file="code/patterns/fields/oneOfMaybe.html" title="oneOfMaybe.cue" play="true"
>}}

However, you cannot have options which are subsets of another option.
The following will error when only `a` is provided:

{{< codePane
  file="code/patterns/fields/subsetFail.html" title="subsetFail.cue" play="true"
>}}

CUE cannot distinguish between the choices.



### AnyOf

AnyOf is a pattern where we want at least one of a set of fields to be present.

AnyOf requires a validator field to check for the existance of optional fields.
The pattern here makes use of

- a set of optional fields that we want 1 or more of.
- the alias `this=` so we can reference the local fields. You can use a different name than `this`.
- a list comprehension over `this`, which uses `list.Contains()` for the fields to check.
- a definition with `this & list.MinItems` to check that there is atleast one of the labels.

{{< codePane
  file="code/patterns/fields/anyOf.html" title="anyOf.cue" play="true"
>}}

Not that we have two variations,
local like `ABC` and `DE`, and
defintion based like `XYZ`.
You can also change the minimum required fields if you so desire
by adjusting the second argument to `list.MinItems`.
It is also possible to have overlapping sets.

_Note, this is a work around until the required fields and builtins proposals
provided a more native method._
See [cueology/futurology](/cueology/futurology) for more details on the proposals.


<!--
### Cross Validation
-->


