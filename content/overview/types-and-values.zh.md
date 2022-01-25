---
title: "类型和数值"
description: "CUE 的类型和数值"
weight: 10
---

{{<lead>}}
接下来介绍 CUE 的基本数据结构。
{{</lead>}}


### 内置类型

CUE 有以下内置的类型，它们有意和 JSON 的类型对齐。

```text
null  bool  string  bytes  number  list  struct
                             |
                            int
```

{{< codePane file="code/overview/types-and-values/builtins.html" title="builtins.cue" >}}

### Top 和 Bottom

Top 和 Bottom 是 CUE 的特殊类型，他们构成了 [格](https://zh.wikipedia.org/wiki/%E6%A0%BC_(%E6%95%B0%E5%AD%A6)) 的两端。

"`_`" 用来表示 top，可以匹配所有值，它也被称为 "any"。

"`_|_`" 用来表示 bottom，代表错误。 (_这个符号将来可能被一个关键词取代_)

### Error

错误结果是在 __bottom__ 并会携带错误信息，当从 CUE 导出数据而有未完成的类型，或在你代码包含冲突或无效的语义时，会发生错误。

{{< codePane2
	file1="code/overview/types-and-values/errors.html" title1="errors.cue" play1="true"
	file2="code/overview/types-and-values/errors.txt" title2="cue eval -c errors.cue" lang2="text"
>}}

__注意，因为这个 [issue](https://github.com/cue-lang/cue/issues/1319) 并不会展示所有的错误__



### 空值结合运算

空值结合运算在发生错误时提供备选，这是个技术方面的错误合并，因为 `null` 是个有效值。

使用析取符和默认值可以设置。

{{< codePane2
  file1="code/overview/types-and-values/coalesce.html" play1="true" title1="coalesce.cue"
  file2="code/overview/types-and-values/coalesce-out.html" title2="cue eval coalesce.cue"
>}}



### Number

CUE 定义了两种数字类型：

- `int` 是整数，通过 BigInt 实现以代表所有值，而且可以限制字节长度（像 int64)
- `number` 是小数，（也不受字节长度限制, ?），整数也是 number

{{< codePane file="code/overview/types-and-values/numbers.html" title="numbers.cue" play="true">}}

CUE 也有一些数字的语法糖：

- 用 `0x`, `0o`, `0b` 分别代表十六进制（hex）, 八进制（octal）和二进制（binary）
- 用 `K, M, G, T, P` 来表示数字大小，后面的 `i` 可以省略
- `e/E` 表示十进制指数
- 可以用下划线让大数更具可读性

{{< codePane2
  file1="code/overview/types-and-values/number-sugar.html" title1="number-sugar.cue" play1="true"
  file2="code/overview/types-and-values/number-sugar-out.html" title2="cue eval number-sugar.cue"
>}}



### String

CUE 的字符串是有效的 UTF-8 字符串，特殊字符可以转义表示。

{{< codePane2
  file1="code/overview/types-and-values/strings.html" title1="strings.cue" play1="true"
  file2="code/overview/types-and-values/strings-out.html" title2="cue eval strings.cue"
>}}

转义方式：

{{<codeInner lang="text">}}
\a   U+0007 alert or bell
\b   U+0008 退格
\f   U+000C 换页
\n   U+000A 换行
\r   U+000D 回车
\t   U+0009 水平制表符
\v   U+000b 垂直制表符
\/   U+002f 斜杠(solidus)
\\   U+005c 反斜杠
\'   U+0027 单引号 (只在单引号引用的字符串中生效)
\"   U+0022 双引号 (只在双引号引用的字符串中生效)

\nnn   八进制      (只在单引号引用的字符串中生效)
\xnn   十六进制    (只在单引号引用的字符串中生效)

\uXXXX  for unicode
\UXXXXXXXX for longer unicode
{{< /codeInner >}}

https://cuelang.org/docs/references/spec/#string-and-byte-sequence-literals

在下面章节中还有一种字符串插值的转义。



### "Raw" String

CUE 允许修改字符串分隔符，所以可以避免使用转义，通过在普通字符串两端添加任意数量的 `#` 就可以。

{{< codePane2
  file1="code/overview/types-and-values/rawstrings.html" title1="rawstrings.cue" play1="ture"
  file2="code/overview/types-and-values/rawstrings.json" title2="cue eval rawstrings.cue --out json" lang2="json"
>}}



### Byte

字节是单引号引用并且输出时会被 base64 编码：

{{< codePane3
  file1="code/overview/types-and-values/bytes.html" title1="bytes.cue"
  file2="code/overview/types-and-values/bytes-eval.html" title2="cue eval bytes.cue"
  file3="code/overview/types-and-values/bytes-export.json" title3="cue export bytes.cue --out json" lang3="json"
>}}



### List

CUE 的列表可以包含任意类型的元素，列表可以保持开放（Open）也可以预设一些元素，错误匹配的元素将会导致错误。

{{< codePane2
  file1="code/overview/types-and-values/lists.html" title1="lists.cue" play1="true"
  file2="code/overview/types-and-values/lists-out.html" title2="cue eval lists.cue"
>}}



### Struct

struct 很像 JSON 对象，它们是 CUE 主要的复合类型。

struct 包含一组字段 (label: value)。

默认情况下，struct 是开放（Open）的，可以被添加更多字段。

{{< codePane file="code/overview/types-and-values/structs.html" title="structs.cue" play="true" >}}



### Definition

`Definition` 很像 struct，主要用于定义结构。

它们默认情况下是关闭（Close）的，而且 CUE 导出时 __不会__ 被输出。

{{< codePane3
  file1="code/overview/types-and-values/defns.html"     title1="defns.cue" play1="true"
  file2="code/overview/types-and-values/defns-out.html" title2="cue eval defns.cue"
  file3="code/overview/types-and-values/defns-exp.html" title3="cue export defns.cue"
>}}



### 嵌套

可以在任意一个 struct 或 definition 中嵌套另一个 struct 或 definition 来构建数据。

通过开放的 struct / definition 和连接符实现同样的效果，但是通常不能修改嵌套的内容。

{{< codePane2
  file1="code/overview/types-and-values/embed.html"     title1="embed.cue" play1="true"
  file2="code/overview/types-and-values/embed-out.html" title2="cue export embed.cue"
>}}



### 模式匹配约束

模式匹配现在允许对通过匹配的标签进行特定的约束。

目前来说还不成熟，但是当 [query 提案](https://github.com/cuelang/cue/issues/165) 接受并实现之后，会变得更强大。

目前，你可以对字符串类型的标签约束，然后将其设为你想要设置的字段的值。

{{< codePane2
  file1="code/overview/types-and-values/patterns.html"     title1="patterns.cue" play1="true"
  file2="code/overview/types-and-values/patterns-out.html" title2="cue export patterns.cue"
>}}

