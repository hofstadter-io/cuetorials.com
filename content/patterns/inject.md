---
title: "Injecting values"
description: "Inject values from the command line"
weight: 15
---


### Tags and the CLI

CUE can inject data from the command line into your configurations.
It uses the `@tag()`

{{< codePane file="code/patterns/inject/tags.html" title="tags.cue" >}}

```shell
# -t key=value  -e to eval a specific value
$ cue eval tags.cue -t database="foo" -e "#DB.conn"
"postgres://postgres.dev:5432/foo"
```


### Combining files

We can combine data using multiple files
and change the results by selecting different files
when running `cue`.

Given the following files:

{{< codePane3 
  file1="code/patterns/inject/app.html" title1="app.cue"
  file2="code/patterns/inject/dev.html" title2="dev.cue"
  file3="code/patterns/inject/prd.html" title3="prd.cue"
>}}

<br>

We can run `cue eval` and switch environmental settings.

{{< codePane2
  file1="code/patterns/inject/dev-out.html" title1="cue eval app.cue dev.cue"
  file2="code/patterns/inject/prd-out.html" title2="cue eval app.cue prd.cue"
>}}

There are more advance patterns using cross directory packages
and conditional imports. Visit the following links to see how.

- [cross directory packages]
- [conditional imports]
