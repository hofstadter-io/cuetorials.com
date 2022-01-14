---
title: "介绍"
description: "Cuelang 介绍"
keywords:
- introduction
weight: 1
---



### CUE 是什么?

CUE 是一门逻辑语言，专门用于处理配置、模式、数据并执行它们。
大多数人开始使用 CUE 是因为要做数据验证和生成配置。
然后他们继续将 CUE 用于数据模板、运行时输入验证、代码生成、脚本、管道等等，
这些我们都将在本教程中进行介绍。

首先你要明白 CUE 并 __不是__ 一种通常意义的程序语言，它是 __图灵非完备__ 的编程语言。

基本理念是，如果把配置和数据编写在一起，人类和机器都更难理解。
可以称为：“用数据封装代码，而不是用代码封装数据”。

CUE 是 JSON 的超集，这意味着你可以用 CUE 来表示任何 JSON：

{{< codePane2
  file1="code/introduction/json-superset/lhs.json" lang1="json" title1="music.json"
  file2="code/introduction/json-superset/rhs.html" title2="music.cue"
>}}

JSONSchema 和 JSON 是完全不同的概念。一个定义了模式，另一个是数据。而在 CUE 中，它们将是一样的。
CUE 将 _类型(types)_ 和 _数据(values)_ 合并为同一个概念，栅格值。
这让我们能在同一个文件中定义模式、进行约束和生成数据。
这也意味着定义模式对人类思考然后实现它都将变得更容易。

在 CUE 中，_类型、数值、约束条件_ 都是一样的定义。
模式、数据、规则是没有区别的（对于 CUE 来说），
但 CUE 有一个 __值的等级结构__， _最高级_（ "`_`" ）可以代表任何值，而 _最低级_ （ "`_|_`" ） 代表 void 空值。

从技术上讲，它是有序集一部分，每个值都有一个唯一的上界以及最大下界。
整个集合从一个根结点 (top, `_`, any) 开始，到某个叶子结点 (bottom, `_|_`, void) 结束，
然后所有的值都在它们两个之间，按照一定的顺序。

{{< codePane file="code/introduction/hierarchy/code.html" play="true">}}

在上面的代码中，我们有一个"类型" `#Schema`，一些"约束条件" `#Constrained`，还有一个"值" `Value`。

带着 `#` 的 `#Definitions:` 定义和不带 `#` 的定义 `Values:` 在语义上有些区别，我们将会在之后的教程中展开。

CUE 有 package、import、典型的基本类型、list 和 struct。

`&` 连接两个或更多 CUE 的 "值"（包括类型、约束条件或数值），来确保结果是有效和正确的。 此外，一个操作符 `|`。

在 `#Constrained` 定义中，你能发现有正则和逻辑操作符，以及调用了一个内置的标准库。

我们都将在后面进行详细讲解。

{{< panel title="CUE 代表 Configure, Unify, Execute" style="primary" />}}


用 CUE 写的代码，并不是给计算机指令。
而是你指定一些东西然后 CUE 告诉你它们是有效还是无效的。
如果现在这个听起来很奇怪，不用担心，它将很快变得明了。

CUE 基于一些 90 年代的 NLP 的技术（早于深度学习），根据图统一算法分析你的代码，
所以你可以在多个目录或者 package 中扩展你的配置，将通用的模式、约束条件、逻辑还有数值组织到可以重用的模块中。

#### _总结：什么是 CUE?_

它是你众多编程工具中新的逻辑语言，CUE 可以帮助你管理配置、校验数据、共享模式、生成代码等等。

CUE 非常年轻，它有光明的未来，我个人是在 devops 中首次接触到 CUE。

我希望你加入我们并给社区带来你自己的最佳实践和新的想法。

### 如何学习 CUE

需要一个文本编辑器并安装命令 `cue`，如果你还没有安装，请从 
[GitHub releases](https://github.com/cuelang/cue/releases) 
下载最新版本的命令行工具。

除此之外，大部分例子都会用到命令行，所以需要一个特定命令行终端工具，当然如果用 VS Code 也可以。

如果对应章节需要额外的工具，也会给出对应的说明。

### 从哪里寻求帮助？

有几个选择：

1. `cue help`, 命令行内置的帮助
2. [GitHub Discussions](https://github.com/cuelang/cue/discussions) (为了持续跟进，请到这里讨论提问)
3. [Cuelang Slack](https://app.slack.com/client/TLUV4Q1ST/CLT3ULF6C) (还有 [invite if needed](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE))
4. [Hofstadter](/getting-help/#hofstadter-commercial-support-for-cue) 提供关于 CUE 的商业支持和服务

