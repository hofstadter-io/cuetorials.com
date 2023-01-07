---
title: "The Go API"
description: "Using Cuelang's Go API"
keywords:
- go
- golang
- api
weight: 40
---

{{<lead>}}
Go + CUE, it's over 9000!
{{</lead>}}

CUE has Go API so you can  work with Cuelang from Go programs.
It offers more granularity and sophistication than the cli.
There are also capabilities only accessible from CUE's Go API.
This section will take you on a tour through
CUE's Go API, showing you how to do Cuelang things in Go.
You will learn how to:

- Load CUE code into CUE values
- Print CUE values with various options
- Extract CUE values, loop over fields and lists
- Extract and work with CUE attributes
- Unify and validate CUE and Go values
- Decode to, and encode from, CUE and Go values
- Validate, constrain, and complete Go values

### Links for Cue's Go docs

These links will be handy as you learn and work with Cue's Go API.

###### {{< cuedoc page="/cue">}}cue{{</cuedoc>}} - The main API for working with Values
###### {{< cuedoc page="/cue/load">}}cue/load{{</cuedoc>}} - Load Cue instances in Go
###### {{< cuedoc page="/cue/build">}}cue/build{{</cuedoc>}} - Build your loaded Cue instances
###### {{< cuedoc page="/cue/build">}}cue/format{{</cuedoc>}} - Format and print Cue Values
###### {{< cuedoc page="/cuego">}}cuego{{</cuedoc>}} - Validate, constrain, or complete Go values
###### {{< cuedoc page="/encoding">}}encoding{{</cuedoc>}} - Parse and generate Yaml, JSON, Protobuf, JSONSchema, and OpenAPI*

<br>

_\* operations depend on the codec, some only work one direction_


<br>

The examples in these sections can be found in `hofstadter-io/cutorials.com` repository
under [code/api](https://github.com/hofstadter-io/cuetorials.com/tree/main/code/go-api)


### Before you start

`cue`'s evaluator is not yet safe for concurrency. See the
[section in cueology/futurology/concurrency](/cueology/futurology/concurrency/)

<br>

---

{{< childpages >}}
