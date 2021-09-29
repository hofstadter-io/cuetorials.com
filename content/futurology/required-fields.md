---
title: "Required Fields"
---

The required fields proposal is meant to
deal with issues around optional and required fields.
At the core, the default behavior and operators will be switched.

- Today, unmarked fields are required for concreteness. They would become optional by default.
- The `?` (optional) specifier will be replaced with `!` (required)

The primary rational is that in most cases, most fields are optional.
There are many other benefits to the language and evaluator.

See [the required fields GitHub issue](https://github.com/cue-lang/cue/issues/822)
for more details.
