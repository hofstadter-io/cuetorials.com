---
title: "基础知识"
description: "Cue 的基础知识"
weight: 5
---


### JSON 超集

CUE 是 JSON 的超集，他包括 JSON 所有的特性并添加了额外的特性，
这意味着 CUE 可以读取并表示 JSON，但并不意味能把 CUE 理解为 JSON。

放心这是个好事，因为这让 CUE 更好理解而且能表示更多东西。
当用 CUE 来表示 JSON 的时候，区别是：

- 可以用 `//` 表示注释
- JSON 中的 Objects 被称为 structs
- Object 成员被称为 struct 字段
- 当 struct 字段不包含特殊字符时，可以省略引号 `"`
- struct 字段后面不需要逗号 `,`
- 在 list 中，最后一个元素后面可以添加逗号 `,`
- 可以省略最外层的大括号


{{< codePane2
  file1="code/overview/foundations/superset.html" title1="superset.cue" play1="true"
  file2="code/overview/foundations/superset.json" title2="cue export superset.cue --out json" lang2="json"
>}}



### 格

任何实体都属于 CUE 的 `格` （[wikipedia](https://zh.wikipedia.org/wiki/%E6%A0%BC_%28%E6%95%B0%E5%AD%A6%29)）。
最通用的值是 "`top`" 或者 "`_`" ，可以匹配任意的实体，
最小范围的值是 "`bottom`" 或者 "`_|_`" ，来表示无效的实体，冲突或错误。
而其他的值都在这两者之间，而且部分有序。
现在可能会比较迷惑，但随着你更多地学习和使用 CUE 之后，将会比较明了。
它基于一些数学的概念，你可以从 [CUE 理论](/theory/) 这章学习更多。

目前来说，将 `top -> schema -> constraint -> data -> bottom` 作为粗略指南会更容易理解。


### 类型和数据

JSONSchema 和 JSON 是完全不同的概念，一个定义了结构，另一个是数据，而在 CUE 中，它们将是一样的。
CUE 将 _类型(types)_ 和 _数据(values)_ 合并为同一个概念：`格`。

这让我们能在同一个文件中定义类型、进行约束和生成数据，也意味着定义类型对人类思考然后实现它都将变得更容易。

{{< codePane3
  file1="code/overview/foundations/tav-schema.html"    title1="Schema"
  file2="code/overview/foundations/tav-constrain.html" title2="Constraints"
  file3="code/overview/foundations/tav-data.html"      title3="Data"
>}}

虽然你可能更熟悉类型（`type`）和数据（`data`），大多数语言不会把约束条件（`constraint`）或者校验（`validation`）作为首要概念。
但是 CUE 恰恰相反，用 约束条件（`constraint`）来管理值的规则或限制，像其他所有的实体一样，它存在于结构和具体数值中间。

CUE 的最佳实践让我们从范围比较大的结构开始，然后逐渐限制，一直到具体的实体结束。

一开始都是从很小的结构定义，然后最终将它们改造成复杂的实体。


### 数值不能被改变

要理解 CUE 最重要的概念之一是 `数值不能被概念`，在 CUE 中没有重载或重写的概念。     

写代码或组织代码的方式都会影响值的变化，这样做的原因是为了维护性和可理解，同时这也是 CUE 的哲学所要求的。

当你在你的配置中找数值在哪里设置的时候，你就会发现其实这很有用。

CUE 不仅仅确保那个值是你设置的，而且会告诉你在哪里设置的，如果发生冲突，也会告诉你冲突的地方。


### 定义字段

CUE 允许字段被定义多次，只要保持一致的就没问题。

- 基本类型必须保持一致
- 你可以不断限制一个字段的范围，但不能放大
- struct 的字段会合并，list 的元素必须完全匹配
- 规则是递归的

{{< codePane2
  file1="code/overview/foundations/fields.html"      title1="fields.cue" play1="true"
  file2="code/overview/foundations/fields-eval.html" title2="cue eval fields.cue"
>}}

使用这些属性对于在一个地方定义结构，然后在另一个地方定义约束、构建配置
以及确保一个字段没有在不同地方错误地设置为不同的值很有用。

### Definition

`definition` 是 CUE 定义结构的方法，它和 struct 有些不同的规则。

- 它们不会作为数据输出
- 它们可能不完整或者未全部指定
- 它们 `指定`（`close`） 一个 struct 包含的字段，防止 struct 包含未知或额外的字段

你可以用 `#mydef:` 定义一个结构，然后用 `...` 放到最后以表明它可以扩展

{{< codePane2
  file1="code/overview/foundations/definition.html" play1="true" title1="definition.cue"
  file2="code/overview/foundations/definition.json" lang2="json" title2="cue export definition.cue --out json"
>}}


### 连接符

连接符可以 "连接"（"meet""）值, 合并他们的字段、规则、数据，就像 "and" 的功能，用 `&` 符号表示。

{{< codePane2
  file1="code/overview/foundations/conjunction.html" play1="true" title1="conjunction.cue"
  file2="code/overview/foundations/conjunction.json" lang2="json" title2="cue export conjunction.cue --out json"
>}}


### 析取

析取符用于"合并"（"join"）可选项或备选方案，就像 `or` 的功能，用 `|` 表示。

{{< codePane2
  file1="code/overview/foundations/disjunction.html" play1="true" title1="disjunction.cue"
  file2="code/overview/foundations/disjunction.json" lang2="json" title2="cue export disjunction.cue --out json"
>}}

析取符可以用于:

- 枚举值
- 多个类型（这些类型中任意一个）
- 空值结合运算（计算或者指定默认值）

### 默认值和可选值

CUE 支持设置值的默认值或指定字段是可选的。

{{< codePane2
  file1="code/overview/foundations/default-optional.html" play1="true" title1="default-optional.cue"
  file2="code/overview/foundations/default-optional.json" lang2="json" title2="cue export default-optional.cue --out json"
>}}


### 不完全（Incomplete）和完全 （Concrete）

没有包含所有字段的数据，可以成为`不完全`的值，CUE 将不会导出未完成的值，而会返回错误。

相反的，`完全`的值是那些所有字段都被指定的数据。

### 开放（Open）和关闭 （Close）

开放表示 struct 可以被扩展，而关闭表示不能被扩展。

默认情况下，struct 是开放的，而 definition 是关闭的。

CUE 也支持让我们显式地做相反的声明。

{{< codePane
  file="code/overview/foundations/open-closed.html" title="open-closed.cue"
>}}

更多相关讨论，请看 [deep-dives/closedness](/deep-dives/closedness/).

### 逐步构建值

在 CUE 中，推荐从很小的定义开始逐渐构建值，让一些结构定义能重用，可以通过嵌套实现定义。

{{< codePane2
  file1="code/overview/foundations/building-up.html" play1="true" title1="building-up.cue"
  file2="code/overview/foundations/building-up.json" lang2="json" title2="cue export building-up.cue --out json"
>}}

### 顺序并不重要

CUE 的合并系统涉及到值、结构和约束条件，但不会考虑顺序或者在哪个文件中。 

{{< codePane3
  file1="code/overview/foundations/order.html"     title1="order.cue"
  file2="code/overview/foundations/order-2.html"   title2="order-2.cue"
  file3="code/overview/foundations/order-out.json" title3="cue export order.cue order-2.cue --out json" lang3="json"
>}}

简单的说，合并只是组合、交换，而且是幂等的。

### 图灵非完备

CUE 是图灵非完备的，意味着不像是通常意义的语言。你只提供值、类型、定义和约束条件，然后 CUE 会告诉你写的是不是正确。
这是有意为之的，而且是基于 Google 多年在管理配置的经验。

核心思想是：

- 用数据封装代码，而不是用代码封装数据
- 没有原始的递归或继承
- 最初的学习曲线值得长期维护

这些限制条件主要灵感是：

- Difficulties with Borgcfg and GCL as complexity grew (i.e. object oriented and lambdas)
- Lingo and Typed Feature Structure Grammars (managing massive configurations)
- Logical and functional languages (various pieces like comprehensions in immutability)
- 随着 Borgcfg 和 GCL 复杂性不断增加遇到的困难（比如 面向对象和 lambdas）
- 术语和类型化结构性的语法（管理大规模配置）
- 逻辑和函数式编程语言（各种部分，像是对不变性的理解）

### 基于 Golang

CUE 开始于 Go 的一个分支，目的是为了简化作为新语言的启动，
Marcel 在 Google 也是 Go 团队的成员，有很多哲学思想也被延续了下来：

- CUE 是用 Go 实现的
- CLI 提供了丰富的工具链
- 这门语言提供丰富的 API
- 包含一个标准库
