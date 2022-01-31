---
title: "打印 Cue"
description: "如何使用 fmt 包格式化打印 Cuelang 的值，以及 Cue 的内置格式"
keywords:
- go
- golang
- api
- print
- format
- syntax
weight: 10
---

{{<lead>}}
CUE 支持 `fmt.Printf` 修饰符，你可以快速打印 CUE 的值。
要在打印时进行细粒度控制，可以使用 `cue/format` 包。
{{</lead>}}

### 使用 go/fmt 打印

{{< codePane2 
	file1="code/go-api/basics/printing/print.go" title1="print.go" lang1="go"
	file2="code/go-api/basics/printing/print.html"  title2="go run print.go"
>}}

### 使用 cue/format 打印

当运行 `cue eval` 和 `cue def` 的时候 我们可以通过 flag 来控制打印格式选项。
这些 flag 可以映射到 `cue.Option` 类型。这种类型的用法常是传入 `cue.Value.Syntax` 函数，
这个函数可以返回 CUE 值的抽象语法树（Abstract Syntax Tree, AST）。
然后我们可以使用 `format.Node` 来格式化打印一个 CUE 的抽象语法树。

{{< codePane2 
	file1="code/go-api/basics/printing/format.go" title1="format.go" lang1="go"
	file2="code/go-api/basics/printing/format.html"  title2="go run format.go"
>}}

##### 链接:
###### {{< cuedoc page="/cue#Value.Syntax" >}}cue.Value.Syntax{{</cuedoc>}} - 把 Value 转换为 AST
###### {{< cuedoc page="/cue#Option" >}}cue.Option{{</cuedoc>}} - Syntax 函数的选项 （也用于其他函数）
###### {{< cuedoc page="/cue/format" >}}cue/format.Node{{</cuedoc>}} - 格式化打印 AST

