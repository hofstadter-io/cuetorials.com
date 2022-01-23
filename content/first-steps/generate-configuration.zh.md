---
title: "生成配置"
description: "用 Cue 生成配置"
keywords:
- configuration
- comprehension
weight: 20
---

CUE 有些灵感来源于函数式语言，然后有很多功能在我们写生成大量配置或数据的"代码"时非常有用。

当你融会贯通连接符、默认值以及条件保护之后，它们都将是你写 CUE 时非常有用的工具。

你可以在 [patterns section](/patterns/) 这一节找到更多例子。

### List 和 Field 推导

List 和 field 推导可以让我们迭代一个 _可迭代的对象_ ，然后生成新的 list 或 field。

可迭代的对象是已存在的 list 或 struct 的 field。

{{< codePane file="code/first-steps/generate-configuration/comprehension.html" play="true">}}

我们之前已经介绍过文件中的一些用法：

- list 推导： `[ for key, val in iterable { ... } ]`，可以不使用 key，只用 value。
- field 推导：`[ for key, val in iterable { ... }]`，我们调用内置的函数插入一个 field，注意要用双引号包裹。
- 字符串插入："\(<a cue expression)"`，这是基于 Swift 的字符串插入，而且当你想要兼容 JSON 时，这个时唯一的机制。
- 隐藏字段：`_hidden: "I'm hidden"` 以下划线开头，CUE 也有隐藏定义 （`_#`）

{{< codePane lang="yaml" file="code/first-steps/generate-configuration/comprehension.yaml" >}}


<br>

### 连接符 和 默认值

我们已经知道如何在验证中使用连接符了，你也可以在生成 value 和配置的时候使用它们。

{{< codePane file="code/first-steps/generate-configuration/conjunction.html" >}}

<br>

### 条件守卫

CUE 有个 `if` 声明，被称为 __守卫__ ，用于保护某个代码区块。

这不是条件分支，而是包含或者排除某些 CUE 代码的一种方法，

回想一下，CUE 是 *_图灵非完备_* 的，因此没有循环或条件分支的概念。

{{< codePane2
  file1="code/first-steps/generate-configuration/guards.html" title1="guards.cue" play1="true"
  file2="code/first-steps/generate-configuration/guards-evald.html" title2="cue eval guards.cue"
>}}

// TODO:

```sh

```

如何获取到所有 `elems` 中 _不_ 包含 `public` 字段的元素？

