---
title: "Field patterns"
description: "Patterns around struct fields"
weight: 3
---


### Either-or Fields

Use disjunctions and an embedding when you want one or another field, but not both.

{{< codePane2
  file1="code/patterns/fields/either-or.html"     title1="either-or.cue" play1="true"
  file2="code/patterns/fields/either-or-out.html" title2="cue eval either-or.cue"
>}}


