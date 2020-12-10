---
title: "Cue's API"
description: "Using Cue's Go API"
weight: 50
---

Cue has Go API so you can  work with Cue from Go programs.
It offers more granularity and sophistication than the cli.
There are also capabilities only accessible from Cue's Go API.
This section will take you on a tour through
Cue's Go API, showing you how to do Cue things in Go.
You will learn how to:

- Load Cue code into Cue values
- Print Cue values with various options
- Extract Cue values, loop over fields and lists
- Extract and work with Cue attributes
- Unify and validate Cue and Go values
- Decode to, and encode from, Cue and Go values
- Validate, constraing, and complete Go values

Working with the encodings is in the [integrations section](/integrations).


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
under [code/api](https://github.com/hofstadter-io/cuetorials/tree/main/code/api)


<br>

---

{{< childpages >}}
