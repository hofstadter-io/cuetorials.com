---
title: "Standard Library"
description: "An overview of Cue's standard library"
weight: 25
---

{{<lead>}}
Cue has a standard library with numerous helper packages.
{{</lead>}}


### Overview

{{< cuedoc page="/pkg" >}}Root of the Go docs{{</cuedoc>}}

There are broadly two types of packages

1. Hermetic functions which you can use from `pure.cue` files.
2. Non-hermetic functions which interact with the outside world. These are for the scripting layer in `_tool.cue` files.

##### Pure Packages

- `crypto/...`: Hash calculations
- `encoding/...`: To / from [base64, csv, hex, json, yaml]
- `html`: For (un)escaping HTML strings
- `list`: For working with lists
- `math`: Extra advanced functions
- `net`: Constraints for network releated values
- `path`: Work with filepaths with OS awareness
- `regexp`: More advanced regexp functions
- `strconv`: Format and parse numbers, quote and unquote runes
- `strings`: Advanced helpers for working with strings
- `struct`: Set min and max fields allowed
- `text/tabwriter`: Write tabular data
- `text/template`: Advanced string templates
- `time`: Format, parse, and constraint times and durations

##### Tool Packages

- `tool/cli`: Work with stdio
- `tool/exec`: Run external commands
- `tool/file`: List, read, and write files
- `tool/http`: Make http requests
- `tool/os`: work with environment vars


### Examples

##### Encoding

{{< codePane file="code/overview/standard-library/encoding.html" title="encoding.cue" play="true">}}

##### Strings

{{< codePane file="code/overview/standard-library/strings.html" title="strings.cue" play="true">}}

##### List

{{< codePane file="code/overview/standard-library/list.html" title="list.cue" play="true">}}

#### Constrain

{{< codePane file="code/overview/standard-library/constrain.html" title="constrain.cue" play="true">}}

