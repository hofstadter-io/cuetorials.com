---
title: "万物皆可生成"
description: "万物皆可生成"
keywords:
- code generation
- template
- hof
- hofstadter
weight: 90
---

CUE 在配置管理方面非常出色，而且解决了大量目前我们其他选择的根本问题。

虽然这是大多数人使用 CUE 的主要使用场景，但是实际上可以用 CUE 生成任何东西。

怎么可能？可以用 `text/template` 包来渲染任何我们想要的文件。

### 用 CUE 生成

{{< codePane file="code/first-steps/generate-all-the-things/first.html" title="first.cue" play="true">}}

{{< codePane file="code/first-steps/generate-all-the-things/first_tool.html" title="first_tool.cue">}}

```sh
cue cmd -t "name=bob" gen
```

CUE 的模板系统使用的 Go 的模板系统，所以所有的兼容性和规则都是一样的。

我们使用了 list 和 field 推导分别渲染和写入我们的模板，使用复杂的 CUE 定义、值以及模板你可以生成任何输出。

### Generating with Hof

At Hofstadter, we built `hof` as a custom tool for sophisticated code generation.
We wanted a single source of truth for our models which we could turn into
the source code for databases, servers, and frontend which implement a full stack app.
We think of it as a "high code" (~~low code~~) solution for developers.
Cue was chosen as the UX/DX for writing the input (designs)
and the generators which `hof` processes.

The two problem with previous systems are:

1. You always end up writing custom code in the generated output
2. Your designs evolve but you've already generated the boilerplate

The solution is actually pretty simple, keep a shadow copy of the generated code
and use a 3-way diff to merge design updates and custom code.

##### With the following two files in a directory, run `hof mod vendor cue` and `hof gen`

{{< codePane file="code/first-steps/generate-all-the-things/cue.mods" title="cue.mods" lang="text">}}

{{< codePane file="code/first-steps/generate-all-the-things/hof.html" title="hof.cue">}}

You can learn more about `hof` from these links:

- https://github.com/hofstadter-io/hof
- https://docs.hofstadter.io

There are also a number of "hofmod" repos for generating CLIs, APIs, and more.
The separation of `hofmod`'s from the `hof` tool means that you can create your own without needing to change our code.
Because they are also Cue modules, you have all the power of Cue and
can import them for reusing or extending your own generators and projects.
