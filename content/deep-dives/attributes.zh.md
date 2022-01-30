---
title: "属性"
description: "cuelang 的属性是给 CUE 和 Go 写的工具用的标记"
brief: "给工具使用的 CUE 标记"
weight: 10
---

{{<lead>}}
属性是 CUE 一种标记形式，用于在 Cuelang 上构建工具。 

`cue` 工具有一些预制的属性，你可以根据不同的用处定义自己的属性。
{{</lead>}}

### 概览

属性是被加在 field 和 struct 上一种标记形式。

它们不会在求值时被处理，只是作为注释。它们也不能在 CUE 中被访问，而且需要你写 Go 去使用它们。

尽管是简单的标记，但是属性给自定义的 Go 工具提供强大的可扩展性和可配置型。

它们原本是为了辅助不同表现形式的映射，比如 Go 和 Protobuf。

然而，你可以给它们指定任何含义或行为，因为它们只能在你的应用中使用。

所以在这个意义上来说，它们和 Go 结构体的 tag 非常像。

属性有一些语法：

- 它们以 `@` 开头，有一个标签以及括号
- 在字段后面或者在 struct 中
- 可以带有几个可选值，并用逗号分割不同的 key
- value 都是字符串，可以是任何你想要的格式

{{< codePane file="code/deep-dives/attributes/format.html" title="format.cue">}}


### `cue` 命令行的属性

`cue` 命令行工具有几个预定义的属性，你可以执行 `cue help injection` 参考。

##### `@tag()` 用于在命令行注入数据

你可以使用这个能力来注入数据和控制被计算的值。

{{< codePane3
	file1="code/deep-dives/attributes/inject.html"      title1="inject.cue"
	file2="code/deep-dives/attributes/inject-dev.html"  title2="cue export inject.cue"
	file3="code/deep-dives/attributes/inject-prod.html" title3="cue export inject.cue -t env=prod"
>}}

使用 `type` 选项来设置解释，也可以用 `short` 来说明可用值。

{{< codePane2
	file1="code/deep-dives/attributes/inject-type.html"  title1="cue eval -t val=3.14 inject-type.cue"
	file2="code/deep-dives/attributes/inject-short.html" title2="cue eval -t prod inject-short.cue"
>}}



##### `@if()` 用于当某个 tag 设置时引用一个文件

用这个特殊的 tag 在求值时引用整个文件

{{< codePane3
	file1="code/deep-dives/attributes/if-main.html" title1="if-main.cue"
	file2="code/deep-dives/attributes/if-qa.html"   title2="if-qa.cue"
	file3="code/deep-dives/attributes/if-prod.html" title3="if-prod.cue"
>}}

{{< codePane3
	file1="code/deep-dives/attributes/if-main-out.html" title1="cue eval ."
	file2="code/deep-dives/attributes/if-qa-out.html"   title2="cue eval -t qa ."
	file3="code/deep-dives/attributes/if-prod-out.html" title3="cue eval -t prod ."
>}}

##### `@go()` 连接不同的表现形式

CUE 在被 Go 代码 import 的时候添加 struct 的 tag。
目前这些会被传递  (`[go,yaml,json,toml,xml,protobuf]`)

##### `@embed()` 已经被提出用于在 CUE 中嵌入其他文件

和 Go 的嵌入系统差不多。

### Propagation

属性如果在归一化、结构化嵌入以及导入过程中传播有一些规则。

这允许你给一个定义增加属性，然后他们将会被添加到 value 中，你也可以添加到属性。


{{< codePane2
	file1="code/deep-dives/attributes/propagation-fields.html" title1="propagations-fields.cue"
	file2="code/deep-dives/attributes/propagation-fields-out.html" title2="cue eval -A propagation-fields.cue"
>}}

{{< codePane2
	file1="code/deep-dives/attributes/propagation-struct.html" title1="propagations-struct.cue"
	file2="code/deep-dives/attributes/propagation-struct-out.html" title2="cue eval -A propagation-struct.cue"
>}}

由于下面的问题，字段属性不会传播

{{< codePane2
	file1="code/deep-dives/attributes/field-prop-issue.html" title1="field-propagation-issue.cue"
	file2="code/deep-dives/attributes/field-prop-issue-out.html" title2="cue eval -A field-propagation-issue.cue"
>}}


### 使用属性 

必须通过 Go 代码来使用属性。

`cue` 通过预定义属性来实现。

看 [go-api/attributes](/go-api/attributes) 这一节来获取更多细节和代码片段。
