---
title: "Builtin Helpers"
---

Several new builtin functions are proposed
to address issues and inconsistencies.

Replacing `_|_` (bottom):

- `error` to enable user defined messages
- `isconcrete` and `exists` for testing or comparisons

Validators:

- `must(expr)` passes if `expr` evaluates to `true` and fails otherwise
- `not(expr)` passes if unified with a value `x` for which `expr&x` fails and `false` otherwise.
- `numexist(count, ...expr)` passes if the number of expressions for which `exists(x)` evaluates to `true` unifies with `count`.
- `numconcrete(count, ...expr)` passes if the number of expressions for which `isconcrete(x)` evaluates to `true` unifies with `count`.
- `numvalid(count, ...expr)` passes if the number of expressions for which `isvalid(x)` evaluates to `true` unifies with `count`.

Others:

- `manifest(x)` evaluates `x` stripping it of any optional fields and definitions and disambiguating disjunctions after their removal.
- `range(from, to, by)` creates a stream of values like found in other languages
- `head([...])` returns the first element of a list
- Package `std` would namespace all core builtins under the `std` package name.

You can find more details on GitHub issue:
[core builtin extensions](https://github.com/cue-lang/cue/issues/943)
