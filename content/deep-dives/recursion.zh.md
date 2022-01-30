---
title: "递归"
---

{{<lead>}}
CUE 不允许一般递归，它是 **图灵非完备** 的。

但是，在 CUE 中仍然有几种不同形式的递归。
{{</lead>}}


### 结构递归

CUE 不允许循环引用。然而，它不会限制定义无限的结构体，比如说链表或二叉树。

我们称之为 [结构递归](https://en.wikipedia.org/wiki/Recursion_%28computer_science%29%23Structural_versus_generative_recursion) ，
这个过程在有限的数据上执行。

{{< codePane2
	file1="code/deep-dives/recursion/linked-list.html" title1="linked-list.cue" play1="true"
	file2="code/deep-dives/recursion/ll-out.html" title2="cue eval linked-list.cue"
>}}


### 有界递归

有界递归是一般递归或生成递归的限定形式。

CUE 的问题所在是一般递归很难或这不可能执行求值器并验证你的 CUE 代码。

有界递归会限制递归的深度，因此问题并不是无解并且在 CUE 的理论下也是被允许的。

这里有关于允许有界递归的讨论：https://github.com/cue-lang/cue/issues/990


与此同时，作为实验，你可以通过推导和函数生成器来模拟有界递归。

你可以在 [GitHub/cuetils](https://github.com/hofstadter-io/cuetils) 这个项目中找到相关代码和例子，
以及很多关于 "递归" 的辅助函数，在那你也可以找到函数的 Go 版本。

_对于任何正规的使用，强烈建议使用有递归支持的语言。Cuetils 以 Go 包也提供相同的辅助函数，支持 CUE 值作为参数。_

当使用 RecurseN 的 CUE 版本和用它构建的“递归”函数时，可能会出现性能问题。

{{< codePane file="code/deep-dives/recursion/recurse.html" title="recurse.cue" play="true" >}}

{{< codePane file="code/deep-dives/recursion/depth.html" title="depth.cue" play="true" >}}

注意 `let depths = ...` 这一行的 `{(#next & {#in: v}).out}`，这是递归，或者实际上是从一个生成的函数到下一个。

- todo, 展示展开的 `#Depth` 什么样，将会帮助理解。

我们应该明白，这里没有函数、没有调用，也没有递归。

我们真正做的是，将一个未完成的定义然后创建一个排列，让他们指向自己的邻居（#RecurseN 中的 for 推导）。

这是减少代码的方法，但是每个 "函数" 都有他自己的标签和分隔的值。

所以我们本质上可以使用字段推导（for 循环），展开一个 "有界递归" 到 struct 的字段中，然后使用索引的后缀来命名，也因此它们是独立的值。

##### 更多例子：

{{< codePane file="code/deep-dives/recursion/pick.html" title="pick.cue" play="true" >}}
{{< codePane file="code/deep-dives/recursion/diff.html" title="diff.cue" play="true" >}}

