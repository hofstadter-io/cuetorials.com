---
title: "标准库"
description: "CUE 标准库概览"
keywords:
- stdlin
- builtin
- standard library
- tool
weight: 25
---

{{<lead>}}
CUE 有包含许多辅助 package 的标准库。
{{</lead>}}


### 概览


{{< cuedoc page="/pkg" >}}CUE 文档首页{{</cuedoc>}}



大体分为两种类型：

1. 一些只能在 `pure.cue` 中使用的封闭函数
2. 一些与外界交互的非封闭函数，它们为 `_tool.cue` 文件的脚本层提供一些函数

##### Pure Packages

- `crypto/...`: Hash calculations
- `encoding/...`: To / from [base64, csv, hex, json, yaml]
- `html`: For (un)escaping HTML strings
- `list`: For working with lists
- `math`: Extra advanced functions
- `net`: Constraints for network related values
- `path`: Work with filepaths with OS awareness
- `regexp`: More advanced regexp functions
- `strconv`: Format and parse numbers, quote and unquote runes
- `strings`: Advanced helpers for working with strings
- `struct`: Set min and max fields allowed
- `text/tabwriter`: Write tabular data
- `text/template`: Advanced string templates
- `time`: Format, parse, and constraint times and durations

##### Tool Packages

- `tool/cli`: Work with stdio
- `tool/exec`: Run external commands
- `tool/file`: List, read, and write files
- `tool/http`: Make http requests
- `tool/os`: work with environment vars


### 示例

##### Encoding

{{< codePane file="code/overview/standard-library/encoding.html" title="encoding.cue" play="true">}}

##### Strings

{{< codePane file="code/overview/standard-library/strings.html" title="strings.cue" play="true">}}

##### List

{{< codePane file="code/overview/standard-library/list.html" title="list.cue" play="true">}}

#### Constrain

{{< codePane file="code/overview/standard-library/constrain.html" title="constrain.cue" play="true">}}

