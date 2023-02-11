---
title: "Comprehension"
---

{{<lead>}}
CUE's comprehensions have several nuances
that you want to be aware of.
{{</lead>}}

### Checking Against Bottom

You can check if a value is present,
or more specifically concrete,
by comparing it to `bottom`.
Note, this is an imperfect comparision
and CUE intends to add [more builtins](/cueology/futurology/builtin-helpers/)
to fix this.

{{< codePane2
	file1="code/deep-dives/comprehension/cond-bottom.html" title1="input.cue"
	file2="code/deep-dives/comprehension/cond-bottom.json" title2="cue export input.cue" lang2="json"
>}}

### Cross-field Checks

You can perform cross-field checks
or add constraints to another field
based on the value of another.

- if base
- disjunction based, where might we be able to do something with conditions that we cannot with disjunctions
  (if field is missing...?)


### Field Comprehension Fields

CUE only loops over regular fields
during field comprehension.

... code ...

If you want to iterate over optional, hidden, or definition fields
you can use the Go API ... link ...

### Loops and Conditions

- looping, if in loop, vs in result


### Multiple, Inline For Loops

- looping, multiple inline


