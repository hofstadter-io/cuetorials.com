---
title: "Integrations"
description: "Integrations with Cuelang"
weight: 50
---

Cue integrates with several other
configuration, schema, and languages.

- enables you to translate between various schema sources
- becomes a source of truth

{{< table >}}
| System      | Import                          | Export                          | Annotations   |
| --          | :--:                            | :--:                            | :--           |
| Yaml        | <b class="text-success">Yes</b> | <b class="text-success">Yes</b> | Cue           |
| JSON        | <b class="text-success">Yes</b> | <b class="text-success">Yes</b> | Cue           |
| JSON Schema | <b class="text-success">Yes</b> | -                               |               |
| OpenAPI     | <b class="text-success">Yes</b> | <i>yes*</i>                     |               |
| Protobuf    | <b class="text-success">Yes</b> | <i>yes*</i>                     | Cue, Protobuf |
| Go          | <b class="text-success">Yes</b> | <i>yes*</i>                     | Cue, Go       |
{{< /table>}}

    * requires writing code

- mappings are non-trivial
- meanings are not the same between them

{{< panel title="Links to content on each integration are coming soon!" style="warning" />}}

### Yaml

### JSON

### JSON Schema

- [Converting to CUE](/first-steps/convert-jsonschema/)

### OpenAPI

### Protobuf

### Golang
