---
title: "Generate Configuration"
description: "Generating configuration with Cue"
weight: 20
---

Cue is partially inspired by functional languages
and has some features which help us to write
"code" which generates large amounts of config or data.
When you combine comprehension with conjunctions, defaults, and guards,
they will all become invaluable assets to your Cue toolbox.

You can find more examples in the [patterns section](/patterns/).

## List and Field Comprehension

List and field comprehensions allow us to iterate over an _iterable_
and generate new lists or fields. An iterable is an existing list or the fields of a struct.

{{< codePane file="code/first-steps/generate-configuration/comprehension.html" play="true">}}

We've introduced a few things in this file:

- list comprehension: `[ for key, val in iterable { ... } ]`. Notice you can leave the key off and you just get the value.
- field comprehension: `[ for key, val in iterable { ... } ]`. We've interpolated a field name by calling a builtin, notice the surrounding quotes.
- string interpolation: `"\(<a cue expression)"`. These are based on Swift's string interpolation and s the only valid mechanism when you want to be JSON compatible.
- hidden fields: `_hidden: "I'm hidden"` which begin with an underscore. There are also hidden definitions (`_#`)

{{< codePane lang="yaml" file="code/first-steps/generate-configuration/comprehension.yaml" >}}


<br>

## Conjunctions and Defaults

We've already seen conjunctions being used for validation.
You can also use them to build up Cue values and your configuration.

{{< codePane file="code/first-steps/generate-configuration/conjunction.html" >}}

<br>

## Guards of Conditionality

Cue has an `if` statement called a __guard__ which protects an area of code.
This is not a conditional branch as much as a way to conditionally include or extend some Cue code.
Recall that Cue is *__turing incomplete__* and thus doesn't have concepts of loop or branches.

{{< codePane2
  file1="code/first-steps/generate-configuration/guards.html" title1="guards.cue" play1="true"
  file2="code/first-steps/generate-configuration/guards-evald.html" title2="cue eval guards.cue"
>}}

```sh

```


How would you get all the `elems` which do _not_ have a `public` field defined?
