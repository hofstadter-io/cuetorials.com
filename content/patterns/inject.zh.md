---
title: "注入值"
description: "通过命令行注入值"
weight: 15
---


### Tags 和命令行

通过使用 `@tag()`，CUE 可以通过命令行将数据注入到你的配置文件。

{{< codePane file="code/patterns/inject/tags.html" title="tags.cue" >}}

```shell
# -t key=value  -e to eval a specific value
$ cue eval tags.cue -t database="foo" -e "#DB.conn"
"postgres://postgres.dev:5432/foo"
```


### 合并文件

当运行 `cue` 时，我们可以在多个文件中合并数据，然后通过选择不同文件来改变结果。

有下面几个文件：

{{< codePane3 
  file1="code/patterns/inject/app.html" title1="app.cue"
  file2="code/patterns/inject/dev.html" title2="dev.cue"
  file3="code/patterns/inject/prd.html" title3="prd.cue"
>}}

<br>

我们可以运行 `cue eval` 然后切换不同的环境设置。

{{< codePane2
  file1="code/patterns/inject/dev-out.html" title1="cue eval app.cue dev.cue"
  file2="code/patterns/inject/prd-out.html" title2="cue eval app.cue prd.cue"
>}}

还有更多使用跨不同目录或条件导入的高级模板，访问下面的链接查看更多：

- [cross directory packages]
- [conditional imports]
