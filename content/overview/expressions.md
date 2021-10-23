---
title: "Expressions"
description: "Expressions in Cue"
weight: 15
---

### Mathematical Operations

Cue has the typical math operations for numbers.
Multiplication also works for strings and lists.

{{< codePane2
  file1="code/overview/expressions/math-ops.html" title1="math-ops.cue" play1="true"
  file2="code/overview/expressions/math-ops-out.html" title2="cue eval math-ops.cue"
>}}

Additional math operations can be found in the Cue's
{{< cuedoc page="/pkg/math" >}}math package{{</cuedoc>}}.

### Comparison Operations

Cue has the expected relative comparison operators and semantics.
Equality checks are handled by value unification.

{{< codePane2
  file1="code/overview/expressions/compare-ops.html" title1="compare-ops.cue" play1="true"
  file2="code/overview/expressions/compare-ops-out.html" title2="cue eval compare-ops.cue"
>}}

### Predefined Bounds

Cue has the following predefined bounds for sized numbers

{{<codeInner lang="text">}}
int8      >=-128 & <=127
int16     >=-32_768 & <=32_767
int32     >=-2_147_483_648 & <=2_147_483_647
int64     >=-9_223_372_036_854_775_808 & <=9_223_372_036_854_775_807
int128    >=-170_141_183_460_469_231_731_687_303_715_884_105_728 &
              <=170_141_183_460_469_231_731_687_303_715_884_105_727

uint      >=0
uint8     >=0 & <=255
uint16    >=0 & <=65536
uint32    >=0 & <=4_294_967_296
uint64    >=0 & <=18_446_744_073_709_551_615
uint128   >=0 & <=340_282_366_920_938_463_463_374_607_431_768_211_455

rune      >=0 & <=0x10FFFF
{{< /codeInner >}}



### Regular Expressions

Cue supports regular expression constraints with the `=~` and `!~` operators.


{{< codePane2
  file1="code/overview/expressions/regexp.html" title1="regexp.cue" play1="true"
  file2="code/overview/expressions/regexp-out.html" title2="cue eval regexp.cue"
>}}

They are based on [Go's regular expressions](https://golang.org/pkg/regexp/).
Cue also has some additional {{<cuedoc page="/pkg/regexp" >}}regexp helpers{{</cuedoc>}}.



### Interpolation

Cue supports interpolation in strings and bytes with `\(<expr>)`

{{< codePane2
  file1="code/overview/expressions/interpolate.html" title1="interpolate.cue" play1="true"
  file2="code/overview/expressions/interpolate-out.html" title2="cue eval interpolate.cue"
>}}

For more complicated scenarios, you can use the {{< cuedoc page="/pkg/text/template" >}}text/template{{</cuedoc>}} package.

You can also interpolate field names. (as we will see shortly)


### List Comprehensions

Cue has list comprehensions to dynamically create lists.
You can iterate over both lists and struct fields.

The form is `[ for key, val in <iterable> [condition] { production } ]`

\* key is the index for lists and the label for fields

{{< codePane2
  file1="code/overview/expressions/list-comp.html" title1="list-comp.cue" play1="true"
  file2="code/overview/expressions/list-comp-out.html" title2="cue eval list-comp.cue"
>}}

_you cannot have more than list element introduced by a conditional_
(https://github.com/cue-lang/cue/discussions/713)

You can work around this with `list.FlattenN`


### Field Comprehensions

Cue also has the ability to comprehend fields.

{{< codePane2
  file1="code/overview/expressions/field-comp.html" title1="field-comp.cue" play1="true"
  file2="code/overview/expressions/field-comp-out.html" title2="cue eval field-comp.cue"
>}}

### Conditional Fields

Conditional fields, or guarded fields (if technically means guard), are another form of field comprehension.

Some important notes to make from the usual understanding of if's:

- there is not an else statement, you have to have two with opposite conditions
- there is no shortcircuiting of booleans, all conditions will be evaluated

{{< codePane file="code/overview/expressions/guards.html" title="guards.cue" play="true">}}
