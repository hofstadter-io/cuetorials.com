---
title: "List 元素存在"
description: "在不知道索引的情况下检查 list 元素存在"
weight: 6
---

检查 List 元素存在的模板让我们验证元素存在而不需要知道它的索引位置。

这个例子用于演示 int 和 string 基本类型的 list：

{{< codePane2
  file1="code/patterns/required-list-elem/check-basic.html" title1="check-basic.cue" play1="true"
  file2="code/patterns/required-list-elem/check-basic-out.txt" title2="cue eval check-basic.cue" lang2="text"
>}}

这个例子用于演示 struct 类型的 list：

{{< codePane
  file="code/patterns/required-list-elem/check-struct.html" title="check-struct.cue" play="true"
>}}

如果你想要检查 struct 有特定的结构，你可以用 `_` 替换定义，

更好的方法是在原始 list 中就进行定义。

一些注意事项：

- 需要 list 的 key 不重复
    - 如果你不关注重复的 key 有不同的值，可以使用 `true` 或 任意值（`_`）代替。
- 当 [Associative Lists](/cueology/futurology/associative-lists/) 实现之后，这个模板就会改变。
