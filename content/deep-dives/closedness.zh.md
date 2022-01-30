---
title: "开放性和封闭性"
description: "CUE 关于开放/封闭的概念"
weight: 22
---

{{<lead>}}
封闭性从扩展性的角度描述值的状态，简单来说，封闭的值不能添加字段，但是开放的值可以。

有很多规则来决定一个值是不是封闭状态，也有很多结构可以定义字段。

所以刚开始也不必担心有点不好理解，因为实现会更复杂！
{{</lead>}}

<br>


### struct 默认是开放的

struct 默认是开放和可以扩展的，你可以直接新增字段或者在连接符后新增字段。

并且对于 struct 所有的字段也都是开放和可扩展的。

{{< codePane file="code/overview/closedness/struct.html" title="struct.cue" play="true" >}}

### 定义（Definition） 默认是封闭的

定义默认会有个固定的结构，确定不会有额外的字段可以添加。

同样的对于它的所有字段也是一样的。

{{< codePane file="code/overview/closedness/definition.html" title="definition.cue" play="true">}}

### 开放、封闭值

你可以使用 `...` 开放定义（Definition），也可以使用 `close` 来封闭 struct。

但是不会递归的应用到所有的字段，只会针对使用关键字的字段生效。 

{{< codePane file="code/overview/closedness/open-n-close.html" title="open-n-close.cue" play="true">}}

### 正则模式约束的封闭性

正则的模式约束会定义一组值。所以即使 `d & #D` 是封闭的，但是仍然可以定义无限的 label。

{{< codePane file="code/overview/closedness/pattern-constraints.html" title="pattern-constraints.cue" play="true">}}

### 通过嵌入扩展定义

嵌入允许扩展定义，当 `#D` 被修改时，被嵌入的新定义也能更新。

{{< codePane file="code/overview/closedness/embed.html" title="embed.cue" play="true">}}

### 隐藏字段

你可以给一个封闭的值添加隐藏的字段，对于定义或者使用 `close()` 被封闭的 struct 都可以生效。

{{< codePane file="code/overview/closedness/hidden.html" title="hidden.cue" play="true">}}

### List 的封闭性

List 的开放和封闭性比 struct 和 定义 的要简单很多，如果使用了省略号（`...`），list 就是开放的。

任何固定的元素都需要在确定的位置上，类型必须对应。

{{< codePane file="code/overview/closedness/list.html" title="list.cue" play="true">}}



