---
title: "内置辅助函数"
---

有几个新的辅助函数被提出来定位问题和冲突。

替换 `_|_`：

- `error` 来启动用户定义消息
- `isconcrete` 和 `exist` 来测试或比较

验证器:

- `must(expr)` passes if `expr` evaluates to `true` and fails otherwise
- `not(expr)` passes if unified with a value `x` for which `expr&x` fails and `false` otherwise.
- `numexist(count, ...expr)` passes if the number of expressions for which `exists(x)` evaluates to `true` unifies with `count`.
- `numconcrete(count, ...expr)` passes if the number of expressions for which `isconcrete(x)` evaluates to `true` unifies with `count`.
- `numvalid(count, ...expr)` passes if the number of expressions for which `isvalid(x)` evaluates to `true` unifies with `count`.

其他:

- `manifest(x)` evaluates `x` stripping it of any optional fields and definitions and disambiguating disjunctions after their removal.
- `range(from, to, by)` creates a stream of values like found in other languages
- `head([...])` returns the first element of a list
- Package `std` would namespace all core builtins under the `std` package name.

可以通过 [core builtin extensions](https://github.com/cue-lang/cue/issues/943) 查看更多细节。

