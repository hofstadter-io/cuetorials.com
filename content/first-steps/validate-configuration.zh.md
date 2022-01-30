---
title: "验证配置"
description: "用 CUE 验证已有的配置"
keywords:
- validate
- configuration
- kubernetes
weight: 5
---

通过验证已有的配置来学习 CUE 是最简单的方法之一，不需要改动任何现有的代码，所以影响和风险很低。

当我们验证已有配置的时候，将会设计一个结构然后通过 CUE 测试它。

### 一个简单的例子

让我们从 `album` 对象的一个简单例子开始，下面是对 `album` 的 JSON 和 CUE 表示。

{{< codePane2
  file1="code/first-steps/validate-configuration/album.json" lang1="json" title1="album.json"
  file2="code/first-steps/validate-configuration/album.html" title2="album.cue" play2="true"
>}}

我们首先看下 CUE 中 `#Album` 的 __定义__ 或 __结构__，
我们没有直接设置字段的数据（值），而是将其设置为类型 `string`。

可以看到  `date` 字段重复了两次，CUE 可以让我们在文件中不断的对一个字段进行约束，甚至跨文件或跨 package 也可以（应对公司策略变化变得更容易）。

在不同的行对进行约束，和使用连接符（`&`）的效果是一样的，所以也可以写为 `date: string & time.Format(...)`。

我们通过 CUE 的标准库添加了一个额外的 __约束__，`import "time"` 然后用 `time.Format("format")` 强制限制日期的格式，日期格式和 Go 的是一样的。
                             j
通过 [time 的 Go 文档] (https://golang.org/pkg/time/) 了解更多 Go 格式的相关内容。

需要特别注意的是设置 `format` 的时候，时间格式是 Go 的诞生的时间（Mon Jan 2 15:04:05 MST 2006）。

可以从 [CUE 的标准库](https://pkg.go.dev/cuelang.org/go/pkg@v0.4.0#section-directories) 中获取更多的辅助类，但是要注意你不能在普通 CUE 文件中 `tool/...` 相关的包，它们是给 脚本层 保留的，我们之后将会介绍到。

`#Album` 的 __结构__ 定义好之后，我们需要将其赋值给 `album`。
由于我们目前构建数据的方式以及 CUE `vet` 的工作方式，这在我们的设置中是必需的。
随着学习的深入，我们将会看到其他的代码风格。

现在我们就能验证我们 ablum 的 JSON 文件了：

```sh
cue vet album.json album-schema.cue
```

这里没有任何输出，让我们看看错误长什么样。

如果我们将 album 的 date，修改为 `97-11-11` 然后重新运行同样的命令，你将会看到下面的错误信息：

```text
$ cue vet album-lhs.json album-validate.cue 
error in call to time.Format: invalid time "97-11-11"
```

<br>

### 一个 Kubernetes 的例子

让我们校验下本站的 Kubernetes 文件，下面是一个 YAML 文件，[从这里查看原始文件](https://github.com/hofstadter-io/cuetorials.com/blob/main/code/first-steps/validate-configuration/cuetorials.yaml) 。

{{< codePane lang="yaml" file="code/first-steps/validate-configuration/cuetorials.yaml" >}}

<br>

### Schema v1

第一步，要给我们的 Kubernetes 资源定义一些顶级的 __定义（Definition）__，
对每种资源类型都有定义，然后 `#Schema` 将使用析取符（`|`）来表明必须通过其中一个实体来进行联合，就像 "or" 的作用一样。

{{< codePane file="code/first-steps/validate-configuration/cuetorials-v1.html" >}}

每种类型都定义为 `struct`（`{}`），并添加字段 `apiVersions` 和 `kind`，然后通过结构体最后添加 `...` 表明可以添加更多字段。
默认情况下, definition 是封闭的，任何未定义的字段将会导致错误。

`apiVersion` 和 `kind` 都是具体的数值，表明我们要验证的配置必须完全匹配。


让我们通过以下命令验证 YAML：

```sh
cue vet cuetorials.yaml cuetorials.cue -d "#Schema"
```

额外增加的 `-d "<path>""` 告诉 CUE 我们想要通过哪个值验证每个 Yaml 条目。

必须添加 `-d` 因为 CUE 默认会使用顶级定义进行验证，但是我们有三种不同的结构，每一种分别代表不同资源类型，所以我们也需要分隔符（`|`）和 `-d` 来让命令生效。

<br>

### Schema v2

现在我们有了一些模板代码，让我们定义更多复杂的验证。

{{< codePane file="code/first-steps/validate-configuration/cuetorials-v2.html" >}}

有几个点我们需要注意：

- 我们虽然已经增加了一些结构定义，但是并不是全部。我们仍然需要增加 `...`，但是如果为了避免增加额外的字段，就需要将其去掉。
- 最通用的 struct 是 `{...}`，空 struct 是 `{}`
- `labels: [string]: string` 在 CUE 中被称为 "模板(Template)"，然后就可以像 struct 定义 label，但是 struct 的"字段"和"值"都是 string 类型。也可以将其定位为更复杂的结构。
- `ports: [...{...}]` 是一个 struct 的列表，你可以用 `ints: [...int]` 定义一个 int 的列表。
- `namespace` 和 `annotations` 后面有个 `?` 表明它们是可选的。

<br>

### Schema v3

你会注意到我们上个章节，有几个定义是重复的。

我们可以给 `label` 和 `metadata` 使用一些可以复用的定义来减少重复，重复的部分可以用新定义的标签替换。

{{< codePane file="code/first-steps/validate-configuration/cuetorials-v3.html" >}}

<br>

### Schema v4

我们经常要确保 label 中特定的标签被指定，这样它们就能在资源不同的部分进行匹配。

所以将结构修改为：

- 增加 `labels: app: string` 以确保 `app` 标签所有资源都有. 注意我们可以通过 `path: to: nested: value` 在一行定义被嵌套的资源
- 在 `#Deployment.spec.selector.matchLabels` 和 `#Service.spec.selector` 使用 `metadata.labels`，这是为了在资源的不同部分也能确保 label 的值是相同的。

{{< codePane file="code/first-steps/validate-configuration/cuetorials-v4.html" >}}

<br>

### 最终的结构定义

这个定义我们还可以补充更多，把它当做一个读者的一个练习吧。
特别 `port` 的定义和验证应该比我们展示的更完善。
