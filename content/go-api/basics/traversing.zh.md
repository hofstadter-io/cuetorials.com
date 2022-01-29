---
title: "遍历"
description: "学习如何遍历 Cuelang 的值"
keywords:
- go
- golang
- api
- iterate
- iteration
- custom
- walk
weight: 70
---

{{<lead>}}
有几种方式遍历 Value。例如基于路径的查找，迭代、以及遍历语法树。
其中一些时可配置的，与不同的字段标签有关，例如常规的、隐藏的、可选的，以及定义。
{{</lead>}}


这一节我们会使用下面这个 Value 作为例子

{{< codePane file="code/go-api/basics/traversing/value.html" title="value.cue" >}}

### Selectors 和 MakePath

我们上一节解释了如何使用 `LookupPath` with `ParsePath` 迭代。
我们可以用 `Selectors` 和 `MakePath` 编程构建路径。
也可以用这些来反向找出Value的标签（也就是最后一级字段名）

{{< codePane2
	file1="code/go-api/basics/traversing/selectors.go"  lang1="go"  title1="selectors.go"
	file2="code/go-api/basics/traversing/selectors.txt" lang2="txt" title2="go run selectors.go"
>}}

文档：
[MakePath](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#MakePath),
[Selectors](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Selector)

### 遍历列表

{{< codePane2
	file1="code/go-api/basics/traversing/list.go"  lang1="go"  title1="list.go"
	file2="code/go-api/basics/traversing/list.txt" lang2="txt" title2="go run list.go"
>}}

文档：
[List](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.List)

### 遍历字段

{{< codePane2
	file1="code/go-api/basics/traversing/fields.go"  lang1="go"  title1="fields.go"
	file2="code/go-api/basics/traversing/fields.txt" lang2="txt" title2="go run fields.go"
>}}

文档：
[Fields](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Fields),
[Options](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Option)

### 在类型上使用 Switch 语句

你也许想根据值的类型进行一些选择性操作。
可以在 `val.IncompleteKind()` 上使用 switch 语句。

{{< codePane2
	file1="code/go-api/basics/traversing/switch.go"  lang1="go"  title1="switch.go"
	file2="code/go-api/basics/traversing/switch.txt" lang2="txt" title2="go run switch.go"
>}}

### 在一个 Value 上 Walk

{{< codePane2
	file1="code/go-api/basics/traversing/walk.go"  lang1="go"  title1="walk.go"
	file2="code/go-api/basics/traversing/walk.txt" lang2="txt" title2="go run walk.go"
>}}

文档：
[Walk](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Walk)

### 自定义遍历

之前的例子演示了默认的遍历，其中一些字段没有被遍历到。
这是因为 CUE 的默认 `Walk()` 方法使用了默认的 `Field()` 。
为了遍历所有字段，我们需要自己定义 walk 函数，从而我们可以给 `Field()` 传入自定义的选项。

{{< codePane2
	file1="code/go-api/basics/traversing/custom.go"  lang1="go"  title1="custom.go"
	file2="code/go-api/basics/traversing/custom.txt" lang2="txt" title2="go run custom.go"
>}}

