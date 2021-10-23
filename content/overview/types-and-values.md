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
null  bool  string  bytes  number  list  struct
                             |
                            int
```

{{< codePane file="code/overview/types-and-values/builtins.html" title="builtins.cue" >}}



### Top and Bottom

Top and Bottom are special values in Cue.
They form the opposite ends of the value lattice.

"`_`" is top and matches all value. It is also called the "any" value.

"`_|_`" is bottom and represents an error. (_this symbol is likely to be replaced with a word in a future version_)



### Errors

Errors result in __bottom__ with a message attached.
You can get errors for incomplete types when exporting Cue to data
or for conflicts and invalid semantics in your code.

{{< codePane2
	file1="code/overview/types-and-values/errors.html" title1="errors.cue" play1="true"
	file2="code/overview/types-and-values/errors.txt" title2="cue eval -c errors.cue" lang2="text"
>}}

__note, not all errors are shown [due to an issue](https://github.com/cue-lang/cue/issues/1319)__



### Null Coalescing

Null coalescing allows us to provide fallback values when errors occur.
This is technically error coalescing since `null` is a vaid value.
This works by using disjunctions and defaults.

{{< codePane2
  file1="code/overview/types-and-values/coalesce.html" play1="true" title1="coalesce.cue"
  file2="code/overview/types-and-values/coalesce-out.html" title2="cue eval coalesce.cue"
>}}



### Numbers

Cue defines two number kinds:

- `int` are whole numbers, implemented as BigInt to represent any value, and can be constrained for byte size (like int64)
- `number` are decimals numbers, (also not bounded by byte size, also constrainable?), ints are also numbers

{{< codePane file="code/overview/types-and-values/numbers.html" title="numbers.cue" play="true">}}

Cue has syntactic sugar for writing numbers too:

- `0x`, `0o`, `0b` for hex, octal, and binary
- `K, M, G, T, P` for sizing with optional `i`
- `e/E` for decimal exponents
- Underscores for visual readability for large numbers

{{< codePane2
  file1="code/overview/types-and-values/number-sugar.html" title1="number-sugar.cue" play1="true"
  file2="code/overview/types-and-values/number-sugar-out.html" title2="cue eval number-sugar.cue"
>}}



### Strings

Cue strings are valid UTF-8 sequences with some escaping options

{{< codePane2
  file1="code/overview/types-and-values/strings.html" title1="strings.cue" play1="true"
  file2="code/overview/types-and-values/strings-out.html" title2="cue eval strings.cue"
>}}

The escape sequences are:

{{<codeInner lang="text">}}
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
{{< /codeInner >}}

https://cuelang.org/docs/references/spec/#string-and-byte-sequence-literals

There is one more escape for string interpolation which we will see in the next section.



### "Raw" Strings

Cue allows you to modify the string delimiters so you can avoid escaping.
Use any number of `#` on both ends of normal strings

{{< codePane2
  file1="code/overview/types-and-values/rawstrings.html" title1="rawstrings.cue" play1="ture"
  file2="code/overview/types-and-values/rawstrings.json" title2="cue eval rawstrings.cue --out json" lang2="json"
>}}



### Bytes

Bytes are single quoted and base64 encoded when output:

{{< codePane3
  file1="code/overview/types-and-values/bytes.html" title1="bytes.cue"
  file2="code/overview/types-and-values/bytes-eval.html" title2="cue eval bytes.cue"
  file3="code/overview/types-and-values/bytes-export.json" title3="cue export bytes.cue --out json" lang3="json"
>}}



### Lists

Cue lists have arbitrary elements of mixed types. They can optionally be open and predefine some elements.
Mismatched elements result in errors.

{{< codePane2
  file1="code/overview/types-and-values/lists.html" title1="lists.cue" play1="true"
  file2="code/overview/types-and-values/lists-out.html" title2="cue eval lists.cue"
>}}



### Structs

Structs are like JSON objects. They are the primary composite type in Cue.
They have a set of fields (label: value).
By default, they are open and you can add more fields.

{{< codePane file="code/overview/types-and-values/structs.html" title="structs.cue" play="true" >}}



### Definitions

Definitions are very similar to structs and are primarily used for schemas.
They are closed by default and are __not__ emitted by Cue when exporting.

{{< codePane3
  file1="code/overview/types-and-values/defns.html"     title1="defns.cue" play1="true"
  file2="code/overview/types-and-values/defns-out.html" title2="cue eval defns.cue"
  file3="code/overview/types-and-values/defns-exp.html" title3="cue export defns.cue"
>}}



### Embeddings

You can embed structs and definitions within each other as a method to build up values.
You can achieve the same with opened structs / definitions and conjunctions, but often we cannot modify what we can embed.

{{< codePane2
  file1="code/overview/types-and-values/embed.html"     title1="embed.cue" play1="true"
  file2="code/overview/types-and-values/embed-out.html" title2="cue export embed.cue"
>}}



### Pattern Matching Constraints

Pattern matching allows you to specify constraints for labels which match a pattern.
While limited in matching today, they will be significantly more powerful once the
[query proposal](https://github.com/cuelang/cue/issues/165) is accepted and implemented.
For now, you can apply a constraint to string labels and use an identifier to set fields if you like.

{{< codePane2
  file1="code/overview/types-and-values/patterns.html"     title1="patterns.cue" play1="true"
  file2="code/overview/types-and-values/patterns-out.html" title2="cue export patterns.cue"
>}}

