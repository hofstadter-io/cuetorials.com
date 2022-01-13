---
title: "Go API"
description: "使用 CUE 的 Go API"
keywords:
- go
- golang
- api
weight: 40
---

CUE 提供 Go API 所以你可以在 Go 程序中使用 Cuelang。

它比 cli 提供更多更细粒度和更精细的 API，有一些只能在 CUE 的 Go API 中使用的功能。

这一章节将带你进入 CUE 的 Go API，给你展示怎么在 Go 中做只有 CUE 相关的工作，
你将学到如何：

- 在 CUE 的值中加载 CUE 代码
- 不同方式打印 CUE 的值
- 提取 CUE 的值, 循环 CUE 的字段和列表
- 统一和校验 CUE 以及 Go 的值
- CUE 以及 Go 值的 Decode 和 Encode
- Go 值的校验、约束条件和补全

### CUE 相关的 Go 文档

这些链接对你学习和使用 CUE Go API 将会非常有用。 

###### {{< cuedoc page="/cue">}}cue{{</cuedoc>}} - The main API for working with Values
###### {{< cuedoc page="/cue/load">}}cue/load{{</cuedoc>}} - Load Cue instances in Go
###### {{< cuedoc page="/cue/build">}}cue/build{{</cuedoc>}} - Build your loaded Cue instances
###### {{< cuedoc page="/cue/build">}}cue/format{{</cuedoc>}} - Format and print Cue Values
###### {{< cuedoc page="/cuego">}}cuego{{</cuedoc>}} - Validate, constrain, or complete Go values
###### {{< cuedoc page="/encoding">}}encoding{{</cuedoc>}} - Parse and generate Yaml, JSON, Protobuf, JSONSchema, and OpenAPI*

<br>

_\* operations depend on the codec, some only work one direction_


<br>
 
本章节相关的例子可以在 `hofstadter-io/cutorials.com` 找到，
在 [code/api](https://github.com/hofstadter-io/cuetorials.com/tree/main/code/go-api) 目录下。


### Before you start

`cue`'s evaluator is not yet safe for concurrency. See the
[section in cueology/futurology/concurrency](/cueology/futurology/concurrency/)

<br>

---

{{< childpages >}}
