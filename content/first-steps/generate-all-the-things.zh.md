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

### 使用 Hof 生成

在 Hofstadter，我们使用 `hof` 用于复杂的代码生成，
我们希望可以通过唯一的来源来生成数据库、后端以及前端的代码。

我们认为对于开发这来说是，这是 `high code` （~~low code~~）的解决方案，CUE 被选为 UX/DX 来写输入（设计）和生成器。

之前系统的两个问题是：

1. 你总会在生成的代码中编写自定义的代码
2. 设计发展了，但是你已经生成了样板代码

解决方案实际上非常简单，保留最初生成代码代码的副本，然后使用 3-way diff 工具来合并设计更新和自定义的代码。

##### 将下面两个文件放到同一个文件夹，然后运行 `hof mod vendor cue` 和 `hof gen`

{{< codePane file="code/first-steps/generate-all-the-things/cue.mods" title="cue.mods" lang="text">}}

{{< codePane file="code/first-steps/generate-all-the-things/hof.html" title="hof.cue">}}

你可以通过下面的链接了解更多 `hof` 相关的内容：

- https://github.com/hofstadter-io/hof
- https://docs.hofstadter.io

也有许多 `hofmod` 的仓库用于生成 CLI、API 以及更多其他内容，

`hofmod` 和 `hof` 工具的分离意味着你可以创建你自己的而不需要修改我们的代码。
因为它们也是 CUE 的模块，所以你可以使用 CUE 的所有功能，也可以引用它们来重用并扩展你自己的生成器和项目。

