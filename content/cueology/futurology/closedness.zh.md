---
title: "封闭性"
---

在很多用例或 issue 中，封闭性如何使用可能会有些变化。

### 不允许在封闭的 struct 中定义非隐藏的字段

[Issue 543](https://github.com/cue-lang/cue/issues/543)

目前，可以在封闭 struct 中引入新的定义，这个提案想要去掉这一点。

下面将会导致一个错误，注意 `foo` 中的 `#bar` 既是 `int` 也是 `string`。

{{< codePane file="code/futurology/closedness/disallow-non-hidden.html">}}


