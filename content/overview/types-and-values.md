---
title: "Types and Values"
description: "Cue's types and values"
weight: 10
---

{{<lead>}}
The following introduces the basic building blocks in Cue.
{{</lead>}}


### Builtin Types

Cue has the following built in types.
They are meant to align with JSON types.

```text
null  bool  string  bytes  number  struct  list
                             |
                            int
```

{{< chromaHTML
  file="code/overview/types-and-values/builtins.html" title="builtins.cue"
>}}



### Top and Bottom

Top and Bottom are special values in Cue.
They form the opposite ends of the value lattice.

"`_`" is top and matches all values

"`_|_`" is bottom and represents an error



### Errors

Errors result in __bottom__ with a message attached.
You can get errors for incomplete types when exporting Cue to data
or for conflicts and invalid semantics in your code.

{{< chromaHTML
  file="code/overview/types-and-values/errors.html" title="errors.cue"
>}}


### Null Coalescing

Null coalescing allows us to provide fallback values when errors occur.
This is technically error coalescing since `null` is a vaid value.
This works by using disjunctions and defaults.

{{< chromaDouble
  lhsPath="code/overview/types-and-values/coalesce.html" lhsTitle="coalesce.cue"
  rhsPath="code/overview/types-and-values/coalesce-out.html" rhsTitle="cue eval coalesce.cue"
>}}


### Numbers

Cue defines two number kinds:

- `int` are whole numbers, implemented as BigInt to represent any value, and can be constrained for byte size (like int64)
- `number` are decimals numbers, (also not bounded by byte size, also constrainable?), ints are also numbers

{{< chromaHTML
  file="code/overview/types-and-values/numbers.html" title="numbers.cue"
>}}

Cue has syntactic sugar for writing numbers too:

- `0x`, `0o`, `0b` for hex, octal, and binary
- `K, M, G, T, P` for sizing with optional `i`
- `e/E` for decimal exponents
- Underscores for visual readability for large numbers

{{< chromaDouble
  lhsPath="code/overview/types-and-values/number-sugar.html" lhsTitle="number-sugar.cue"
  rhsPath="code/overview/types-and-values/number-sugar-out.html" rhsTitle="cue eval number-sugar.cue"
>}}


### Strings

Cue strings are valid UTF-8 sequences with some escaping options

{{< chromaDouble
  lhsPath="code/overview/types-and-values/strings.html" lhsTitle="strings.cue"
  rhsPath="code/overview/types-and-values/strings-out.html" rhsTitle="cue eval strings.cue"
>}}

The escape sequences are:

```text
\a   U+0007 alert or bell
\b   U+0008 backspace
\f   U+000C form feed
\n   U+000A line feed or newline
\r   U+000D carriage return
\t   U+0009 horizontal tab
\v   U+000b vertical tab
\/   U+002f slash (solidus)
\\   U+005c backslash
\'   U+0027 single quote  (valid escape only within single quoted literals)
\"   U+0022 double quote  (valid escape only within double quoted literals)

\nnn   for octals         (valid escape only within single quoted literals)
\xnn   for hex            (valid escape only within single quoted literals)

\uXXXX  for unicode
\UXXXXXXXX for longer unicode
```

https://cuelang.org/docs/references/spec/#string-and-byte-sequence-literals

There is one more escape for string interpolation which we will see in the next section.


### "Raw" Strings

Cue allows you to modify the string delimiters so you can avoid escaping.
Use any number of `#` on both ends of normal strings

{{< chromaDouble
  lhsPath="code/overview/types-and-values/rawstrings.html" lhsTitle="rawstrings.cue"
  rhsPath="code/overview/types-and-values/rawstrings-out.html" rhsTitle="cue eval rawstrings.cue"
>}}


### Bytes

Bytes are single quoted and base64 encoded when output:

{{< chromaTriple
  lhsPath="code/overview/types-and-values/bytes.html" lhsTitle="bytes.cue"
  midPath="code/overview/types-and-values/bytes-eval.html" midTitle="cue eval bytes.cue"
  rhsPath="code/overview/types-and-values/bytes-export.html" rhsTitle="cue export bytes.cue"
>}}

### Lists

Cue lists have arbitrary elements of mixed types. They can optionally be open and predefine some elements.
Mismatched elements result in errors.

{{< chromaDouble
  lhsPath="code/overview/types-and-values/lists.html" lhsTitle="lists.cue"
  rhsPath="code/overview/types-and-values/lists-out.html" rhsTitle="cue eval lists.cue"
>}}

### Structs

Structs are like JSON objects. They are the primary composite type in Cue.
They have a set of fields (label: value).
By default, they are open and you can add more fields.

{{< chromaHTML
  file="code/overview/types-and-values/structs.html" title="structs.cue"
>}}


### Definitions

Definitions are very similar to structs and are primarily used for schemas.
They are closed by default and are __not__ emitted by Cue when exporting.

{{< chromaTriple
  lhsPath="code/overview/types-and-values/defns.html" lhsTitle="defns.cue"
  midPath="code/overview/types-and-values/defns-out.html" midTitle="cue eval defns.cue"
  rhsPath="code/overview/types-and-values/defns-exp.html" rhsTitle="cue export defns.cue"
>}}


### Embeddings

You can embed structs and definitions within each other as a method to build up values.
You can achieve the same with opened structs / definitions and conjunctions, but often we cannot modify what we can embed.

{{< chromaDouble
  lhsPath="code/overview/types-and-values/embed.html" lhsTitle="embed.cue"
  rhsPath="code/overview/types-and-values/embed-out.html" rhsTitle="cue eval embed.cue"
>}}


### Pattern Matching Constraints

Pattern matching allows you to specify constraints for labels which match a pattern.
While limited in matching today, they will be significantly more powerful once the
[query proposal](https://github.com/cuelang/cue/issues/165) is accepted and implemented.
For now, you can apply a constraint to string labels and use an identifier to set fields if you like.


{{< chromaDouble
  lhsPath="code/overview/types-and-values/patterns.html" lhsTitle="patterns.cue"
  rhsPath="code/overview/types-and-values/patterns-out.html" rhsTitle="cue eval patterns.cue"
>}}

