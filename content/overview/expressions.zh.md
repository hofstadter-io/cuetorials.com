---
title: "表达式"
description: "CUE 的表达式"
weight: 15
---

### 数学运算符

CUE 包含数字的标准的数学表达式，也可以在 string 或 list 中使用乘法。 

{{< codePane2
  file1="code/overview/expressions/math-ops.html" title1="math-ops.cue" play1="true"
  file2="code/overview/expressions/math-ops-out.html" title2="cue eval math-ops.cue"
>}}

在 CUE 的 {{< cuedoc page="/pkg/math" >}}math package{{</cuedoc>}} 中还有其他的运算操作。

### 比较运算符

CUE 拥有比较运算符和语义，值合并时会处理相等性检查。

{{< codePane2
  file1="code/overview/expressions/compare-ops.html" title1="compare-ops.cue" play1="true"
  file2="code/overview/expressions/compare-ops-out.html" title2="cue eval compare-ops.cue"
>}}

### 预设范围

CUE 针对数字拥有以下预设的范围：

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



### 正则表达式

CUE 支持正则表达式，通过 `=~` 和 `!~` 进行限制。


{{< codePane2
  file1="code/overview/expressions/regexp.html" title1="regexp.cue" play1="true"
  file2="code/overview/expressions/regexp-out.html" title2="cue eval regexp.cue"
>}}

它们基于 [Go 的正则表达式](https://golang.org/pkg/regexp/) ， CUE 也有一些额外的{{<cuedoc page="/pkg/regexp" >}}regexp helpers{{</cuedoc>}}


### Interpolation

CUE 使用 `\(<expr>)` 就可以 string 或 byte 中插入值。

{{< codePane2
  file1="code/overview/expressions/interpolate.html" title1="interpolate.cue" play1="true"
  file2="code/overview/expressions/interpolate-out.html" title2="cue eval interpolate.cue"
>}}

更多复杂的场景，你可以使用 {{< cuedoc page="/pkg/text/template" >}}text/template{{</cuedoc>}} 包。

你也可以插入字段名称（下面章节会讲）。


### List 推导

CUE 可以通过 list 推导动态生成 list，可以遍历 list 或 struct 的字段。

形式是 `[ for key, val in <iterable> [condition] { production } ]`

\* key 是 lists 的索引, 在 struct 中是字段的名称

{{< codePane2
  file1="code/overview/expressions/list-comp.html" title1="list-comp.cue" play1="true"
  file2="code/overview/expressions/list-comp-out.html" title2="cue eval list-comp.cue"
>}}

_每次条件判断只能引入一个元素_
(https://github.com/cue-lang/cue/discussions/713)

可以使用 `list.FlattenN` 解决这个问题


### Field 推导

CUE 也可以通过推导生成字段

{{< codePane2
  file1="code/overview/expressions/field-comp.html" title1="field-comp.cue" play1="true"
  file2="code/overview/expressions/field-comp-out.html" title2="cue eval field-comp.cue"
>}}

### 条件字段

条件字段，或受保护的字段（技术上意味着保护），是另一种形式的字段推导

相对于通常意义的 if，有一些注意事项：

- 没有 else 条件，必须有两个相反的判断条件
- 不会忽略任何判断条件，所有的条件都会被计算

{{< codePane file="code/overview/expressions/guards.html" title="guards.cue" play="true">}}
