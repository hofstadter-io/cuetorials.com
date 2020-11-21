---
title: "Anatomy of a File"
description: "Overview of a Cue File"
weight: 5
---

The following shows a Cue file and the common elements you will write.

```text
package foo               // Package statement (optional, but recommended)

// Golang style imports
import (
  // builtin packages
  "list"
  "strings"
  
  // module imports
  "github.com/hofstadter-io/hof/schema"
)

//// Basic values

myString: "hello world"

myInt: 1
myFloat: 1.2


```
