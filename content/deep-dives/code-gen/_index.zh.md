---
title: 代码生成

---

CUE 的代码生成有几种类型：

配置或数据类型（Yaml、Json）:

- __导出__: CUE -> data (cue export)
- __导入__: data -> CUE (cue import)

语言类型：

- __Get Go__: Go -> CUE   (cue get go)
- __TypeGen__: CUE -> Go   (... custom ...)

*__一些注意事项：__*

_（1）CUE 现在只支持导入 Go_

_（2）CUE 只能使用 Go 的类型_

_（3）CUE 没有函数，所以没有 DSL，我们不能使用 CUE 表示这些_

{{<childpages>}}
