---
title: "CUE 上下文（Context）"
description: "Overview for to use the Cuelang Context to compile CUE using the Go API"
description: "概览：使用 Go API 中的 Cuelang 上下文（Context）编译 CUE"
weight: 5
keywords:
- go
- golang
- api
- context
- cuecontext
- compiling
- encoding
---

{{<lead>}}
介绍 CUE 的 Go API 要从上下文对象 `cue.Context` 开始。
上下文对象可以用来编译 CUE 代码和构建 values 对象（稍后章节介绍）。
下面介绍上下文对象的基本用法，后面的章节会逐步增加复杂的场景。
{{</lead>}}

_当操作多个 value 的时候，他们应当来自同一个运行时。这个要求会在未来的版本中移除。_


### 使用 Context 编译

这是一个最简单的程序，打印一个 CUE value 对象。
如果其中有错误，程序将会打印遇到的第一个错误。

{{< codePane2
	file1="code/go-api/basics/context/context.go" lang1="go" title1="context.go"
	file2="code/go-api/basics/context/context.html"  title2="go run context.go"
>}}


### 编译时指定范围（Scope）

如果值（value）和类型（schema）在不同的字符串中，
你可以使用 `cue.Scope` 选项来给 `cue.Context` 对象提供一个更具体的上下文。

{{< codePane2
	file1="code/go-api/basics/context/scope.go" lang1="go" title1="scope.go"
	file2="code/go-api/basics/context/scope.html"  title2="go run scope.go"
>}}

### Encoding Values from Go
### 从 Go 类型编码为 Value

你可以把你的 Go 类型和值转为 CUE value。
可以通过结构体标签（tag）来控制输出。注意

- 只有导出的字段可以被CUE编码
- 可以使用 `omitempty` 阻止输出该字段，但是这样也会影响这个类型的其他编码。
- 数字类型有一些怪异之处，我们稍后再谈。CUE 通常使用 `math/big` 类型。
- 你可以在这里查看细节 [pkg.go.dev cue.Context.Encode docs](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Context.Encode).

{{< codePane2
	file1="code/go-api/basics/context/encoding.go" lang1="go" title1="encoding.go"
	file2="code/go-api/basics/context/encoding.html"  title2="go run encoding.go"
>}}

