---
title: "关联列表"
---

CUE 没有 `set` 类型，可以使用 __关联列表__

关联列表是给每个值定义 key 的列表，很容易把它变为 map。

在 CUE 中，有相同 key 的元素会合并然后合并到单个元素，就像 struct 一样。

下文中，我们有：

- `original.cue` 包含我们要合并的两个 list
- `results.cue` 包含最终想要获取的结果
- `systax.cue` 包含如何用 CUE 实现


用了 `@.field` 语法来定义一个 key 用于检测哪个值需要被合并，最终产生结果。

{{< codePane3
  file1="code/futurology/associative-list/orig.html" title1="original.cue"
  file2="code/futurology/associative-list/result.html" title2="result.cue"
  file3="code/futurology/associative-list/syntax.html" title3="syntax.cue"
>}}

你可以在 Github 上查看更多细节：

- [Original issue](https://github.com/cue-lang/cue/issues/14)
- [Proposed syntax](https://github.com/cue-lang/cue/issues/165#associative-lists)

目前，你可以使用 struct 来实现 list 去重，查看 [list 去重](/patterns/unique-list/) 获取更多细节。
