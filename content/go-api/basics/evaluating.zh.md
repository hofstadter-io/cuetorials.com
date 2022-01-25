---
title: "对 Value 求值"
keywords:
- go
- golang
- api
- validate
- unify
- subsume
- eval
- options
weight: 50
---

{{<lead>}}
求值是 CUE 的核心能力，并且是其他一切功能（如统一和验证）的底层能力。
本节将展示如何在 Go 中进行求值，而且可以用选项控制其行为。
{{</lead>}}



### Value.Validate()

Validate 函数会在一个 Value 上运行求值过程，返回一个 error 类型。
前面已经演示过如何不带参数地使用该函数了。
Validate 也可以接受传入 `cue.Option` 类型的参数来控制过程。
没错，就是我们之前传给 `Value.Syntax(...Option)` 的那些参数。

{{< codePane2
	file1="code/go-api/basics/evaluating/validate.go"  lang1="go"  title1="validate.go"
	file2="code/go-api/basics/evaluating/validate.txt" lang2="txt" title2="go run validate.go"
>}}

[Validate 的文档](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Validate)

__因为不是每一个 Option 在这里都可以使用，
在这里查看关于这个话题的讨论 [issue 1329](https://github.com/cue-lang/cue/discussions/1329), 
讨论结果更清楚之后我们会更新文档。__



### Value.Unify()

Unify 函数其实就是 CUE 中的 `&` 操作符。用同样的方式可以把两个值结合起来。
函数返回的是聚合的结果。

{{< codePane2
	file1="code/go-api/basics/evaluating/unify.go"  lang1="go"  title1="unify.go"
	file2="code/go-api/basics/evaluating/unify.txt" lang2="txt" title2="go run unify.go"
>}}

[Unify 文档](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Unify)


### Value.Subsume()

Subsume 是一种在`格`的概念下比较两个 Value 的关系的强力工具。
`Subsume` 会告诉你一个 Value 是不是另一个的实例。换句话说，他检查一个 Value 是否完全向后兼容另一个。

下面的例子里，我们对每一对 Value 检查两个方向的容纳情况。
每一对的两个方向，期待的情况是一个方向通过而另一个失败。

{{< codePane2
	file1="code/go-api/basics/evaluating/subsume.go"  lang1="go"  title1="subsume.go"
	file2="code/go-api/basics/evaluating/subsume.txt" lang2="txt" title2="go run subsume.go"
>}}

[Subsume 文档](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Subsume)

__为什么 `>10` 不能被 `int` 容纳?__

原因是 `>10` 是一个在 number 类型上的限制，这一点和 `int` 相似。
记得吗，`number` 可以表示整数和小数。
这意味着这两个限制在格上是平等的。
可以设置为 `i: int & >10`，这个限制就可以被 `int` 容纳了。

_另外请注意，如果所有 Value 都在同一个文件里，意味着已经聚合过了_


### Value.Eval()

Eval 函数会解析所有引用，保证具体性，发现所有错误，并最终产生一个新的值。
求值结果包含在返回的新值中。

{{< codePane2
	file1="code/go-api/basics/evaluating/eval.go"  lang1="go"  title1="eval.go"
	file2="code/go-api/basics/evaluating/eval.txt" lang2="txt" title2="go run eval.go"
>}}

[Eval 文档](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Eval)

__这个函数可能有一个Bug，具体请查看 [issue 1326](https://github.com/cue-lang/cue/issues/1326)__



### Value.Evaluate()

这个函数的提案已经提出了，但还没有实现。
它可以像 Validate 和 Syntax 接受 `...Option` 参数，处理后返回一个新的 Value。

`func (v Value) Evaluate(opts ...Option) Value {...}`

如果你认为这个函数很有用，可以在 [issue 1327](https://github.com/cue-lang/cue/issues/1327)
下面发言，让开发人员得知。
 