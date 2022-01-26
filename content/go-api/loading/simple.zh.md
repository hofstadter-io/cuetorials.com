---
title: "Cue 加载"
description: "如何加载 CUE 文件"
weight: 5
---


### 加载和打印 CUE 代码 

这是第一个例子，演示如何加载打印和验证 CUE

{{< codePane3
	file1="code/go-api/loading/simple.go"  title1="simple.go" lang1="go" 
	file2="code/go-api/loading/hello.html" title2="hello.cue"
	file3="code/go-api/loading/simple.txt" title3="go run fields.go" lang3="txt" 
>}}

<br>

### 加载的配置

CUE 的 `load.Instances` 接受传入第二个参数用来配置选项。
在 CLI 中不同的命令，标志（flag）和参数就是用来配置这些选项的。
当用 Go 来加载时，我们可以设置 `Config` 对象来设置这些选项。

{{< cuedoc page="/cue/load#Config" >}}load.Config documentation{{</cuedoc>}}

注释里解释了如何使用这些选项。
一旦你更加了解 CUE，你就知道
他们中大多数用于高级用例，那时候会更有意义
其他的你已在 CLI 的 flag 里看过了。

