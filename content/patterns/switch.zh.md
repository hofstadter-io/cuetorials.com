---
title: "Switch 声明"
description: "在 CUE 中模拟 Switch 声明"
weight: 7
---

### 模板

我们可以使用 list 推导来模拟 switch 声明，

{{< codePane file="code/patterns/switch/pattern.html">}}

这个模板在 list 中有很多 `if` 条件或 守卫，然后选择第 `[0]` 个元素。

通过这种方式，我们模拟了 switch 声明，就像其他语言一样。

需要注意的是，所有的条件声明都会被求值。


### 一个简单的例子

这个例子演示如何将 integer 转为描述其数字类型的 string。

{{< codePane2
  file1="code/patterns/switch/switch.html" title1="switch.cue" play1="true"
  file2="code/patterns/switch/switch.json" title2="cue export switch.cue" lang2="json"
>}}

### 顺序相关性

在下面 `order` 这个例子中，我们通过分解这个模板来演示。

真正有前缀的字符串确实能拿到正确的结果，但是我们也可以看到，当 `a` 和 `b` 一样的时候，
HasPrefix 仍然可以匹配，所以我们会得到不那么准确的结果。

{{< codePane2
  file1="code/patterns/switch/order.html" title1="order.cue" play1="true"
  file2="code/patterns/switch/order.json" title2="cue export order.cue" lang2="json"
>}}

### case 未覆盖错误

我们可以修改一下我们第一个例子来演示如果忘记 default 默认值的话会发生什么，或未覆盖所有条件的话会发生什么。

{{< codePane2
  file1="code/patterns/switch/uncovered.html" title1="uncovered.cue" play1="true"
  file2="code/patterns/switch/uncovered.sh" title2="cue export uncovered.cue" lang2="shell"
>}}

### 所有的条件都会求值

你可能会觉得下面的例子能正常运行而不会报错。

这是所有条件被求值之后的结果，也就是说，求值过程没有死循环。

{{< codePane2
  file1="code/patterns/switch/conditions.html" title1="conditions.cue" play1="true"
  file2="code/patterns/switch/conditions.sh" title2="cue export conditions.cue" lang2="shell"
>}}

