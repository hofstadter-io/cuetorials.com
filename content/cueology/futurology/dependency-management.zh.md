---
title: "依赖管理"
---

虽然 CUE 有 modules 和 package，但是还没有依赖管理系统。

提议的系统和 Go 的系统非常接近。

你可以在 [package management proposal](https://github.com/cue-lang/cue/issues/851) 获取更多信息。

另外，有两种方法来管理依赖

1. 使用脚本将其下载到 `cue.mod/pkg` 目录
2. 使用 `hof mod` 通用 MVS 依赖管理系统

可以在 [first-steps/modules-and-packages](/first-steps/modules-and-packages/) 查看 `hof mod` 的例子。
