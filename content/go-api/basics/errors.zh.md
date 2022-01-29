---
title: "错误处理"
description: "Cuelang Go API 的错误处理"
keywords:
- go
- golang
- api
- error
- handling
weight: 30
---

{{<lead>}}
CUE 有其自己的错误类型，实现了 Go 中的 error 接口。
可以使用 `cue/errors` 包来拆解和打印。
{{</lead>}}

{{< codePane2
	file1="code/go-api/basics/errors/errors.go"  lang1="go"  title1="errors.go"
	file2="code/go-api/basics/errors/errors.txt" lang2="txt" title2="go run errors.go"
>}}

可以在这里查看更多信息 [pkg.go.dev cue/errors](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue/errors).

