---
title: "List 去重"
description: "Lists 去重"
weight: 5
---

List 去重是很常见，通常用于检测和移除重复数据，去重可以分为两种，同时也都有对应的方法。

1. 根据 key 去重
2. 根据 value 去重

选择哪种去重方式，取决于是否存在 "唯一键"。

也就是说，如果你能根据一组字段构造唯一键，那就可以用方法 1，否则需要用方法 2。

最好选择方法 1，因为随着数据增多，方法 2 可能会导致更多的 runtime。

### 根据 Key 去重

要实现的是基于 key 或一组字段检测然后移除重复的数据。

我们实现的方式是根据 struct 推导将 list 转换为 "map"，然后再将其转回 list。

{{< codePane2
  file1="code/tasks/unique-list-by-key.html"     title1="unique-list-by-key.cue" play1="true"
  file2="code/tasks/unique-list-by-key-out.html" title2="cue eval unique-list-by-key.cue"
>}}


### 根据 Value 去重

这里要实现的是基于所有的 Value 检测并移除重复数据。

我们使用了 list 包还有 list 推导。

{{< codePane2
  file1="code/tasks/unique-list-by-val.html"      title1="unique-list-by-val.cue" play1="true"
  file2="code/tasks/unique-list-by-val-out.html" title2="cue eval unique-list-by-val.cue"
>}}

