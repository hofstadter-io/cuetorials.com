---
title: "Generate Configuration"
description: "Generating configuration with Cue"
weight: 20
---

Cue is paritally inspired by functional languages
and has some features which help us to write
"code" which generates large amounts of config or data.
When you combine comprehension with conjunctions, defaults, and guards,
they will all become invaluable assets to your Cue toolbox.

You can find more examples in the [patterns section](/patterns/).

## List and Field Comprehension

List and field comprehensions allow us to iterate over an _iterable_
and generate new lists or fields. An iterable is an existing list or the fields of a struct.

{{< chromaHTML file="code/starting-out/generate-configuration/comprehension.html" >}}

We've introducted a few things in this file:

- list comprehension: `[ for key, val in iterable { ... } ]`. Notice you can leave the key off and you just get the value.
- field comprehension: `[ for key, val in iterable { ... } ]`. We've interoplated a field name by calling a builtin, notice the surronding quotes.
- string interpolation: `"\(<a cue expression)"`. These are based on Swift's string interpolation and s the only valid mechanism when you want to be JSON compatible.
- hidden fields: `_hidden: "I'm hidden"` which begin with an underscore. There are also hidden definitions (`_#`)

{{< chromaCode lang="yaml" file="code/starting-out/generate-configuration/comprehension.yaml" >}}


<br>

## Conjunctions and Defaults

We've already seen conjunctions being used for validation.
You can also use them to build up Cue values and your configuration.

{{< chromaHTML file="code/starting-out/generate-configuration/conjunction.html" >}}

<br>

## Guards of Conditionality

Cue has an `if` statement called a __guard__ which protects an area of code.
This is not a conditional branch as much as a way to conditionally include or extend some Cue code.
Recall that Cue is *__turing incomplete__* and thus doesn't have concepts of loop or branches.

{{< chromaHTML file="code/starting-out/generate-configuration/guards.html" >}}

```sh
cue eval guards.cue
```

{{< chromaHTML file="code/starting-out/generate-configuration/guards-evald.html" >}}

How would you get all the `elems` which do _not_ have a `public` field defined?
