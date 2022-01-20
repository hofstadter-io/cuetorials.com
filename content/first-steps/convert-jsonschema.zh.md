---
title: "转换 JSON Schema"
description: "本文介绍如何将 JSON Schema 转为 Cuelang."
keywords:
- jsonschema
- convert
- validate
weight: 15
---

{{<lead>}}
JSON Schema 得到了广泛的应用，但是结构和验证都很复杂。

CUE 可以导入任何 Json Schema，可以提高可读性和可维护性。
{{</lead>}}


### JSONSchema

JSON Schema 本身也是 JSON，区别是 Schema 是一种 DSL （领域特定语言），也就是说它有自己特定的字段和结构。
当我们将其导入 CUE 时，`cue` 命令行会识别并处理。

我们会用 [这里](https://github.com/compose-spec/compose-spec) 的 `docker-compose` 规范。
你可以从 [Schema Store](https://www.schemastore.org/json/) 找到许多例子或者用一些你周围的例子。

用下面的命令下载 `docker-compose` 规范：

{{< codeInner lang="sh" >}}
wget https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json
{{< /codeInner >}}


<details>
  <summary class="h5">compose-spec.json (800+ lines)</summary>

{{< codePane file="code/first-steps/convert-jsonschema/compose-spec.json" title="compose-spec.json" lang="json">}}

</details>


<br>

### 转换为 Cuelang

将 JSON Schema 转为 CUE 非常简单。

{{< codeInner lang="sh" >}}
cue import -f -p compose -l '#ComposeSpec:' compose-spec.json
{{< /codeInner >}}

- `-f` 强制覆盖输出文件 (compose-spec.cue)
- `-p` 设置输出文件的 package 
- `-l` 是放置结构的标签
- 最后一个参数是输入文件

因为 `docker-compose.yaml` 有非常多的字段，所以 CUE 最终也有 400+ 行，但是 CUE 会更容易阅读和理解。

<details>
  <summary class="h5">compose-spec.json (400+ lines)</summary>

{{< codePane file="code/first-steps/convert-jsonschema/compose-spec.html" title="compose-spec.cue" >}}

</details>

<br>

### 用 CUE 进行验证

现在可以像在 [验证配置](/first-steps/validate-configuration) 中一样验证 `docker-compose.yaml`。

在这里，我们要用 `-d` 参数指定验证的结构。

{{< codeInner lang="sh" >}}
cue vet -d '#ComposeSpec' docker-compose.yaml compose-spec.cue
{{< /codeInner >}}

<br>

### 缺点

通过 JSON Schema 生成 CUE 非常简单，然而，生成的 CUE 并不是有总是创建和验证数据的最佳结构。

这主要是因为原始结构未指定或有不寻常的类型。

因此，你可能会发现自己在不断地构建和完善导入的结构定义。

以下内容来自上面生成的 `docker-compose`:

##### 缺少规范

有的时候结构定义里面没有增加验证，我们知道对于 `docker-compose` 有固定的的格式和有效版本，但在代码中并没有：

{{< codeInner >}}
#version?: string
{{< /codeInner >}}

##### 任意字段类型

对于更多复杂的字段，我们可以使用 `_`（`top`），但是这样对字段没有任何的校验。

当 Go 有自定义编码函数类型，进行导入的时候经常会遇到。

{{< codeInner >}}
#constraints: _
{{< /codeInner >}}

##### 重复

如果原始定义中没有，CUE 很难做到检测代码重复和可复用的结构。

下面的例子中 CUE 有很多冗余的代码，这也会发生在一些比较顶级使用了 `regexp` 的字段，比如 service 和 volume。

{{< codePane3
  file1="code/first-steps/convert-jsonschema/duplication.html" title1="duplication.cue"
  file2="code/first-steps/convert-jsonschema/shared.html" title2="shared.cue"
  file3="code/first-steps/convert-jsonschema/improved.html" title3="improved.cue"
>}}

