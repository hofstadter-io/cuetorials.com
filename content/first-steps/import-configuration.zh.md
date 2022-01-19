---
title: "导入配置"
description: "导入已有的配置生成Cue"
keywords:
- import
- convert
- go
- golang
weight: 10
---

为了节省时间精力和减少犯错，CUE 有些命令可以导入和最小化已存在的配置生成 CUE 代码。

### 导入配置

`cue import` 将会导入 Yaml 和 JSON 的文件和目录生成 CUE 代码，
有一些参数可以控制 CUE 如何执行和组织输出。

让我们继续使用 Cuetorials 的 Kubernetes 例子，在 `cuetorials.yaml` 所在的目录执行下面的命令：

```sh
cue import -f -o cuetorials.cue -l 'strings.ToLower(kind)' -l 'metadata.name' -p cuetorials cuetorials.yaml
```

- `-f` 覆盖输出文件
- `-o` 设置输出的文件名
- `-l` 告诉 CUE 如何命名值以避免冲突，这里我们将会用 `<kind>: <name>: {...}`
- `-p` 指定 CUE 的 package： `package cuetorials`
- 最后一个参数是我们的原始文件，但是也可以是通配符或者目录（`./...`)

{{< codePane file="code/first-steps/import-configuration/cuetorials-import.html" title="cuetorials.cue">}}

<br>

### Go 生成 CUE

CUE 可以将 Go 的类型转换为 CUE 的定义，当你写好了代码并想验证 Yaml 或 JSON 能不能解析成对应的类型时非常有用。
                                             j
你也可以通过 CUE 的结构定义生成 Go 的辅助函数来验证这些类型（详情：[Cuelang docs](https://cuelang.org/docs/integrations/go/#generate-go-code) ， 需要写 Go 代码）

在我们使用 Go 生成 CUE 之前，我们需要新建一个文件，用于 CUE modules。

我们将在 [module & package](/first-steps/modules-and-packages) 这一节讨论 module 和 package，
目前我们先创建这个文件 `cue.mod/module.cue`

{{< codePane file="cue.mod/module.html" >}} 

有了这个之后, 接下来我们要做:

1. 把 Kubernetes API 包的代码下载下来（需要在本地）
2. 从 Go 导入生成 CUE 定义
3. 将 Kubernetes CUE 代码应用到我们的 Cuetorials 的 CUE 代码
4. 验证我们的配置是否符合 Kubernetes 的规范

```sh
# "go get" 获取 Kubernetes API 相关的代码
go get k8s.io/api/... k8s.io/apimachinery/...

# "cue go get" 导入到 CUE 的定义
cue get go k8s.io/api/... k8s.io/apimachinery/...

# 检查 "cue get go" 在 cue.mod/gen 文件夹生成了什么
tree cue.mod/gen/
```

现在将以下几行加入到你的 `cuetorials.cue` 文件中：

{{< codePane file="code/first-steps/import-configuration/cuetorials-add.html" >}}

现在试着运行 `cue eval cuetorials.cue`，很可能会看到很多错误。

这是因为 Kubernetes 从几个地方接受 string 和 integer，为了修复这些问题，在 integer 前添加 `IntVal: <#>` （或 `StrVal:`，如果你使用的是包含 string 的其他 yaml）

- `deployment >>> rollingUpdate`
- `deployment >>> httpGet`
- `service >>> targetPort`
- `ingress >>> servicePort`

当 `cue eval` 没问题之后（打印出 CUE 的值）你可以运行 `cue trim` 来删除冗余的代码（基于最小化和默认值）。

在 CUE 的学习路径上有关于 高级修剪，基于 _anti-unification_

{{< codePane file="code/first-steps/import-configuration/cuetorials-trimmed.html" >}}

你可能会说，"这个奇怪的 int 或 string 类型的端口并不能匹配我的 Kubernetes 文件"，确实会这样。

我们会在"集成"这一节会介绍如何让 OpenAPI 的规范生效和更多相关的内容。
