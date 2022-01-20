---
title: "集成"
description: "和 Cuelang 进行集成"
weight: 50
---

CUE 和其他几种配置、结构、以及语言的集成。

- 在几种不同的定义结构中切换
- 成为真正的源头

{{< table >}}
| 类型         | 转为 CUE                        | 通过 CUE 生成                        | Annotations   |
| --          | :--:                            | :--:                            | :--           |
| Yaml        | <b class="text-success">Yes</b> | <b class="text-success">Yes</b> | Cue           |
| JSON        | <b class="text-success">Yes</b> | <b class="text-success">Yes</b> | Cue           |
| JSON Schema | <b class="text-success">Yes</b> | -                               |               |
| OpenAPI     | <b class="text-success">Yes</b> | <i>yes*</i>                     |               |
| Protobuf    | <b class="text-success">Yes</b> | <i>yes*</i>                     | Cue, Protobuf |
| Go          | <b class="text-success">Yes</b> | <i>yes*</i>                     | Cue, Go       |
{{< /table>}}

    * 代表需要额外写代码

- 并不是简单的映射
- 意味着它们之间并不相同

{{< panel title="每种集成的详情链接很快就会完善并给出!" style="warning" />}}

### Yaml

### JSON

### JSON Schema

- [JSONSchema 转为 CUE](/first-steps/convert-jsonschema/)

### OpenAPI

### Protobuf

### Golang
