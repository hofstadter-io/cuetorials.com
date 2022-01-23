---
title: "模块和包"
description: "Cue 模块和包的使用"
keywords:
- mod
- module
- package
- dependency
- management
- hof
- hofstadter
weight: 50
---

CUE 像其他语言一样，也有模块（module）和包（package）系统。

因为有 module 和 package，所以也有 import。

对于像 Yaml 和 JSON 的配置语言来说，这是最重要的优点之一。

CUE 的模块系统和 Go 的非常相似，但是也有不同点。

- 一个模块名有特定的格式
  - `domain.com/name` 是最小的模块
  - `github.com/owner/repo` 是通用模块
  - import 时不加 domain，表明引入内置的标准包
  - 不是需要一个真正的 domain 或 repository，只是定义需要的路径
- 必须创建一个文件（`cue.mod/module.cue`）来声明模块
- 模块由很多包组成，CUE 支持在一个目录中包含多个 package
- 只允许绝对路径的引用，不允许相对路径的引用（出于安全考虑）
- 可以在引用时修改包的名字（就像之前看到的 k8s.io 的引用）
- 同一个包下的`定义`和`值`可以直接访问而不需要引用

_但是，CUE 还没有依赖管理系统，它将引用和处理他们。详情参考下文_

### 定义模块

为了定义模块，只需要简单的添加一个 `cue.mod/module.cue` 文件。

在创建之前，你将 _不_ 能引用其他目录或模块的文件。

{{< codePane file="code/first-steps/modules-and-packages/listing.txt" title="file listing" lang="shell">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/module.html" title="cue.mod/module.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/root.html" title="root.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/a/a.html" title="a/a.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/bar.html" title="cue.mod/pkg/github.com/foo/bar/bar.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/b/b.html" title="cue.mod/pkg/github.com/foo/bar/b/b.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/multi/hello.html" title="cue.mod/pkg/github.com/foo/bar/multi/hello.cue">}}
{{< codePane file="code/first-steps/modules-and-packages/cue.mod/pkg/github.com/foo/bar/multi/world.html" title="cue.mod/pkg/github.com/foo/bar/multi/world.cue">}}

当运行下面的命令，将看到输出合并了 module 和 package

{{< codePane file="code/first-steps/modules-and-packages/eval.html" title="cue eval root.cue">}}


<br>

### 依赖管理

CUE 的依赖都在 `cue.mod/pkg/...` 文件下，依赖的模块的文件路径和引用它们的路径一样。

```text
cue.mod
├── module.cue
└── pkg
    └── github.com
        ├── foo
        │   └── bar
        └── hofstadter-io
            ├── hof
            ├── hofmod-cli
            └── hofmod-server
```

CUE 目前还没有依赖管理系统，你必须通过其他方式获取它们。（[Open issue](https://github.com/cuelang/cue/issues/409）)

Fortunately, Hofstadter has built a generalized dependency management system as part of our `hof` tool,
based on `go mod` and Minimum Version Selection (MVS).
While it does not have all of the automation of a `go mod` solution, but should help you out unitl Cue has its own.

First, you will need to initialize a module

`hof mod init cue github.com/hofstadter-io/cuetorials` will setup both the `cue.mods` file and the `cue.mod/module.cue` file.

The format for `cue.mods` looks like Go's.

{{<codeInner title="cue.mods">}}
// this should match the cue.mod/modules.cue value
module "github.com/hofstadter-io/cuetorials"

cue = master // or another version, not really used but a required field

require (
domain.com/owner/repo v0.1.2    // select a version
domain.com/other/repo v0.0.0    // latest version
)

replace github.com/other/repo => github.com/myorg/repo  // replace with a different remote repository
replace github.com/hof/studios => ../../studios         // local replace
{{< /codeInner >}}

`hof` will not inspect your code to determine dependencies, thus you have to __always__ manually add them.

When you add or change dependencies, or change the code in a local replace, run the following command
to fetch them to your modules "vendor" directory (cue.mod/pkg)

```sh
hof mod vendor cue
```

`hof` will fetch, cache, and update your dependencies using the MVS algorithm.
You will now be able to import from both the dependencies and local directories to your module.
If you only want local imports, you don't need

You can learn more about Hofstadter and our `hof` tool at https://docs.hofstadter.io

We also have several modules available on GitHub (https://github.com/hofstadter-io)
using the `hofmod-` prefix. These are designed for our code generation framework,
discussed in the final section of "first-steps".

