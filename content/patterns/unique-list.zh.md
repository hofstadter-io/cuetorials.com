---
title: "List 去重"
description: "Lists 去重"
weight: 5
----

Finding the unique elements of a list is a common task,
often tied to detecting or removing duplicate values.
There are two versions and accompanying methods.

1. Unique elements by key
2. Unique elements by value

The choice depends on the presense of a "unique key."
That is, if you can construct a unique key from a set of fields,
then use option 1, else you will need to use option 2.
Prefer option 1 as option 2 will have much worse runtimes
as the input grows.

### Unique Elements by Key

The goal here is to detect and remove duplicates
based on a key or set of fields.
The way we do this is to turn the list
into a "map" using struct comprehension
and then convert it back to a list.

{{< codePane2
  file1="code/tasks/unique-list-by-key.html"     title1="unique-list-by-key.cue" play1="true"
  file2="code/tasks/unique-list-by-key-out.html" title2="cue eval unique-list-by-key.cue"
>}}


### Unique Elements by Value

The goal here is to detect and remove duplicates
based on a the entire value.
We use the list package and list comprehension.

{{< codePane2
  file1="code/tasks/unique-list-by-val.html"      title1="unique-list-by-val.cue" play1="true"
  file2="code/tasks/unique-list-by-val-out.html" title2="cue eval unique-list-by-val.cue"
>}}

