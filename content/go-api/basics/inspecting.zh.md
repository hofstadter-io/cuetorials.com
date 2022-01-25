---
title: "检查 Values"
description: "在 Go 代码中检查 CUE values"
keywords:
- go
- golang
- api
weight: 60
---

{{<lead>}}
CUE Value类型有一系列方法，让我们得以检查他们的内容，状态和位置。
我们前面看到了如何打印完整的值及其错误状态，下面这些函数提供了更详细的细节。
{{</lead>}}


本节我们在例子中会使用下面这个 CUE 文件。

{{< codePane
	file="code/go-api/basics/inspecting/value.html" title="value.cue"
>}}

### LookupPath, Path

`Path` 方法返回到某个值的路径，
返回的路径可以在 `LookupPath` 函数中使用来获取值。
这两个函数可以看作两个相反的过程。

{{< codePane2
	file1="code/go-api/basics/inspecting/path.go"  lang1="go"  title1="path.go"
	file2="code/go-api/basics/inspecting/path.txt" lang2="txt" title2="go run path.go"
>}}

文档:
[LookupPath](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.LookupPath),
[Path](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Path)


### ReferencePath 和 Dereference

`ReferencePath` 

{{< codePane2
	file1="code/go-api/basics/inspecting/reference.go"  lang1="go"  title1="reference.go"
	file2="code/go-api/basics/inspecting/reference.txt" lang2="txt" title2="go run reference.go"
>}}

文档:
[ReferencePath](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.ReferencePath),
[Dereference](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Dereference)

### Exists 和 IsConcrete

当你查找一个 Value 时，你怎么知道你收否找到了呢？这就用到了 `Exists` 方法。

`IsConcrete` 方法可以表明一个原子字段有数据或是一个错误。
对于列表或结构体类型，如果他们存在则返回true。
当使用析取和默认值时... 

{{< codePane2
	file1="code/go-api/basics/inspecting/exists.go"  lang1="go"  title1="exists.go"
	file2="code/go-api/basics/inspecting/exists.txt" lang2="txt" title2="go run exists.go"
>}}

使用 `Validate` 方法检查一整个value是否时具体的。

文档:
[Exists](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Exists),
[IsConcrete](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.IsConcrete)



### Kind and IncompleteKind

`Kind` 和 `IncompleteKind` 方法能返回一个值的类型。
`IncompleteKind` 更加细粒度，而且不管一个值是否完整，都可以返回类型。（这个方法名看起来有点反了）

{{< codePane2
	file1="code/go-api/basics/inspecting/kind.go"  lang1="go"  title1="kind.go"
	file2="code/go-api/basics/inspecting/kind.txt" lang2="txt" title2="go run kind.go"
>}}

你可以在这俩函数的返回值上用 switch 语句。

文档：
[Kinds](https://pkg.go.dev/cuelang.org/go@v0.4.0/internal/core/adt#Kind),
[Kind](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Kind),
[IncompleteKind](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.IncompleteKind)

### 类型转换

Value 类型有一些函数可以把抽象类型转换为 Go 底层类型。
你应该首先确认 Value 的类型，再尝试转换。

{{< codePane2
	file1="code/go-api/basics/inspecting/conversions.go"  lang1="go"  title1="conversions.go"
	file2="code/go-api/basics/inspecting/conversions.txt" lang2="txt" title2="go run conversions.go"
>}}

### Len

`Len` 返回一个list的长度以及一个 bytes 里的字节数。

{{< codePane2
	file1="code/go-api/basics/inspecting/length.go"  lang1="go"  title1="length.go"
	file2="code/go-api/basics/inspecting/length.txt" lang2="txt" title2="go run length.go"
>}}

文档:
[Len](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Len)

