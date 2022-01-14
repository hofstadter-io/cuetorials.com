---
title: "已知问题"
description: "CUE 的已知问题以及追踪链接"
weight: 20
---

### Errors

- [1319: Not all errors printed](https://github.com/cue-lang/cue/issues/1319)
- [1093: Error flags not working](https://github.com/cue-lang/cue/issues/1093)
- There are many issues regarding accuracy or correctness of the error message
- Also see futurology for the custom error message proposal

### Root Value

通常 root 不能被访问，
这个错误会影响 `-e` 标志和使用引号引用的标识符，例如 `"dashed-id": 42`。
这些不能在命令行引用，它会更改 CLI 以特殊方式允许访问 root 范围，然后就能访问到这些值。

[请移步 issue #358](https://github.com/cue-lang/cue/issues/358)

### Encoders

有很多关于 encoder 的问题，大多数都是不一致的问题。

### Playground

playground 和 CLI 不是完全一致的，
如果你在 playground 遇到了问题，需要确认它在 `cue` 命令行中也有。

