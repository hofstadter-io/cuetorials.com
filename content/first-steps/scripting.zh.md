---
title: "CUE 脚本"
description: "Cue 工具层脚本的使用"
keywords:
- script
- scripting
- cue/tool
- tooling layer
weight: 60
---

CUE 的评价模型可以将你和变化的值隔离，然后和外界进行交互，值在每次运行时可以修改。

这样做是因为要加强一致性，为了和外界世界写作，CUE 提供工具层可以访问执行的命令、读写文件以及进行网络调用。

（"tool" 可用的列表可以在 [这里找到](https://pkg.go.dev/cuelang.org/go@v0.4.0/pkg/tool)

要使用它，和普通的 CUE 有些不同：

- 脚本文件以 `_tool.cue` 为后缀
- 命令用 `cue cmd <name>` 执行

也可以在脚本文件中使用 "纯" CUE 的代码，但是不能反过来（将会违反规则）。

- CUE 明确防止计算
- 但是我们需要在操作中经常合并这些配置和任务
- CUE 脚本/工作流 

### 脚本示例

这个例子取自 `cue help cmd`，但对注释做了一些修改。

工具文件都有通用的格式：

- `command: <name>: { ... }` 是要用 `cue cmd 调用的命令
- 每个命令都包含很多任务 `<task name>: <task type> & { ... }`，任务类型都来自内置的 ` tool/...`
- 任务类型有不同的字段，有些是输入有些是输出
- 默认情况下，任务会并发执行，如果引用了其他的任务，将使用 DAG 排序

`ex_tool.cue` (用 `cue cmd prompter` 运行)

{{< codePane file="code/first-steps/scripting/ex_tool.html" >}}


