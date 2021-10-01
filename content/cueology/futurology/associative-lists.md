---
title: "Associative Lists"
---

CUE does not have a `set` type.
The proposed method is to use
__associative lists__.

An associative list is a list that defines a key for each of its values, effectively turning it into a map.
In CUE terms, elements with the same key are unified and collapsed onto a single element as if it were a struct.

In the following, we have

- `original.cue` contains two lists we'd like to unify
- `results.cue` contains the desired results
- `syntax.cue` contains the CUE to make this happen

The syntax uses the `@.field` to define the key
used to determine which values should be unified
to produce the result.

{{< codePane3
  file1="code/futurology/associative-list/orig.html" title1="original.cue"
  file2="code/futurology/associative-list/result.html" title2="result.cue"
  file3="code/futurology/associative-list/syntax.html" title3="syntax.cue"
>}}


You can find more details on GitHub:

- [Original issue](https://github.com/cue-lang/cue/issues/14)
- [Proposed syntax](https://github.com/cue-lang/cue/issues/165#associative-lists)

Today, you can use structs to achieve
unique elements to or from a list.
See the [unique list pattern](/patterns/unique-list/)
for more details

