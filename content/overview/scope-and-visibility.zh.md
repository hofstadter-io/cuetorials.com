---
title: "作用域与可见性"
description: "CUE 的作用域和可见性规则"
weight: 20
---

### 静态作用域

CUE 使用 [静态作用域而非动态作用域](https://en.wikipedia.org/wiki/Scope_(computer_science))

引用的求值(或解析)是惰性的，参考 https://cuelang.org/play/?id=5AmcbLo3DPC#cue@export@cue

"example" 的字段结合了 #example 的定义，example 也没有将 #example 的字段放到它的作用域中。

### 引用查找

CUE 将会从最近的封闭作用域中查找要引用的值，

有些特殊的点：

- 没有引号的字段，可以通过"点记法"作为标识符进行引用
- 有引号的字段，必须通过"索引引用"
- 跨作用域中定义字段，必须通过完整的路径解析

{{< codePane file="code/overview/scope-and-visibility/lookup.html" title="lookup.cue" play="true" >}}

### 别名 (Alias)

别名定义一个不属于 struct 的值，它们可以用于访问经过处理的字段、定义中间计算或表达式等，它们也不会被输出。 

{{< codePane file="code/overview/scope-and-visibility/alias.html" title="alias.cue" play="true">}}

### 路径（Paths)

正如我们所看到的，有好几种方式可以访问嵌套的值。

{{< codePane file="code/overview/scope-and-visibility/paths.html" title="paths.cue" play="true">}}


### 隐式字段和值

隐式字段和值通过在前面增加下划线定义，可以在当前 package 进行引用，在计算时可以可选的显示它们，`cue eval -H hidden.cue`。

如果想定义一个确实包含下划线的字段需要使用引号进行引用。

{{< codePane3
file1="code/overview/scope-and-visibility/hidden.html"     title1="hidden.cue" play1="true"
file2="code/overview/scope-and-visibility/hidden-out.html" title2="cue eval hidden.cue"
file3="code/overview/scope-and-visibility/hidden-viz.html" title3="cue eval -H hidden.cue"
>}}

注意，隐式字段在不同 package 中是不可见的，所以不可以使用引用的 package 中隐式字段。

### 引用循环

CUE 可以处理多次引用循环，只要它们最终能被解析为具体的值。

{{< codePane file="code/overview/scope-and-visibility/ref-cycle.html" title="ref-cycle.cue" play="true">}}

### 构造循环

CUE 不允许存在构造循环和递归，可以定义无限的结构只要数据是有限的。

{{< codePane file="code/overview/scope-and-visibility/structural.html" title="structural.cue" play="true">}}

