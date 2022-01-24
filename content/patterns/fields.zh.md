---
title: "结构体字段模板"
description: "结构体字段相关的模板"
weight: 3
---

{{<lead>}}
本文有许多模板，可以让我们给结构体字段添加复杂的约束和验证。 
{{</lead>}}


### OneOf

OneOf 模板用于强制一组字段中的一个且只有一个，我们使用分隔符和嵌入来创建。

{{< codePane
  file="code/patterns/fields/oneOf.html" title="oneOf.cue" play="true"
>}}

你也可以增加更多选项，如果你想让它们都失效也可以设置为空

{{< codePane
  file="code/patterns/fields/oneOfMaybe.html" title="oneOfMaybe.cue" play="true"
>}}

然而，你不能使用其他选项的集合，如果只设置 `a` 下面的例子将会报错：

{{< codePane
  file="code/patterns/fields/subsetFail.html" title="subsetFail.cue" play="true"
>}}

CUE 不能区分这些选择。


### AnyOf

AnyOf 模板用于选择一组字段中的至少一个。

AnyOf 需要用于验证的字段来检查可选的字段是否存在，这个模板用到了：

- 一组可选字段，选择其中的一个或多个
- 使用 `this=` 所以我们可以引用本地字段，你可以使用不同于 `this` 的字段
- 使用 `this` 进行 list 推导，还用了 `list.Contains()` 来检查字段
- 有个使用 `true & list.MinItems` 的定义，用于检查至少包含其中一个标签

{{< codePane
  file="code/patterns/fields/anyOf.html" title="anyOf.cue" play="true"
>}}


注意我们有两种不同的方式，基于自身判断的像 `ABC` 和 `DE`，以及基于定义的 `XYZ`。

如果你想的话，你也可以通过修改 `list.MinItems` 的第二个参数来修改所需的最少字段，也可以有重叠的集合。

_注意，在必须字段和内置的提案提供更多原生的方法之前这算是一种解决方案_

查看 [cueology/futurology](/cueology/futurology) 获取提案的更多内容。

<!--
### Cross Validation
-->


