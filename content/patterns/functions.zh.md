---
title: "函数模板"
description: "在 CUE 中重用转换"
weight: 5
---

你可以使用 CUE 的定义或结构体来创建函数，就像对象（Object）一样。

通常情况下它有输入或输出，而且你可以实现任何你想要的功能。


有一个提出简化官方语法的提案，在 [core builtin extensions](https://github.com/cue-lang/cue/issues/943) 的开头获取更多细节。

{{< codePane file="code/patterns/functions/function.html" title="function.cue" play="true" >}}

{{< codeInner title="cue eval function.cue -e result" >}}
"in": {
    "count": 3,
    "msg": "ra"
},
"out": {
    "val": "RA RA RA"
}
{{< /codeInner >}}

