---
title: "Field patterns"
description: "Patterns around struct fields"
weight: 3
---


### Either-or Fields

Use disjunctions and an embedding when you want one or another field, but not both.

{{< chromaDouble
  lhsPath="code/patterns/fields/either-or.html" lhsTitle="either-or.cue"
  rhsPath="code/patterns/fields/either-or-out.html" rhsTitle="cue eval either-or.cue"
>}}


