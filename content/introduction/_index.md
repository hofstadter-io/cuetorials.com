---
title: "Introduction"
description: "Introduction to Cuelang"
keywords:
- introduction
weight: 1
---



### What is Cue?

Cue is a purpose built logical language for working with config, schemas, data, and executing on these things.
Most people start with Cue by validating and generating configuration.
They then move on to data templating, runtime input validation,
code generation, scripting, pipelines, and oh so much more
which we'll cover throughout these tutorials.

First, you should understand that
Cue is __not__ a general purpose language
and instead aims for __Turing-incompleteness__.
The underlying philosophy is that it is
harder for both humans and tooling to understand
configuration and data that has been programmed together.
The saying is "Wrap code in data, not data in code."

Cue is a superset of JSON. This means you can represent any JSON in Cue
with a slightly different syntax and then some Cue super powers to boot!

{{< codePane2
  file1="code/introduction/json-superset/lhs.json" lang1="json" title1="music.json"
  file2="code/introduction/json-superset/rhs.html" title2="music.cue"
>}}

If you think about JSONSchema vs JSON, they are separate concepts.
One defines a schema, the other is data. In Cue they are the same.
Cue merges types and values into a single concept, the value lattice.
This gives us the ability to
define schemas, refine with constraints, and create valid data in the same file.
It also means defining schemas is more natural with how we think about and write code as humans.

In Cue, _types, values, and constraints_ are all the same.
There is no difference (to Cue) between the schema, the data, or the rules.
Cue has a __value hierarchy__ which connects
_top_ (`_`), the any value, to _bottom_ (`_|_`), the void value.
Technically it is a lattice or partially ordered set of values
where every pair of values has a unique upper bound
and a greatest lower bound.
The entire lattice starts from a singular root (top, `_`, any),
ends with a single leaf (bottom, `_|_`, void),
and all other values are between these two, partially ordered.

{{< codePane file="code/introduction/hierarchy/code.html" play="true">}}

In the code above, we have a "type" `#Schema`, some constraints `#Constrained`, and a `Value`.
`#Definitions:` had slightly different semantics and rules than `Values:` which we will expand on in the tutorial.
Cue has packages, imports, all the typical basic types, lists, and structs.
The `&` combines two or more Cue "values" (all three of {type, constraint, value}) in a conjunction ("and")
and ensures that the result is valid and correct. There is also a disjunction ("or") operator `|`.
In `#Constrained`, you can see a regexp and logical operators as well as a builtin from the standard library.
We'll go into the in greater depth later.

{{< panel title="CUE stands for Configure, Unify, Execute" style="primary" />}}

With Cue, when you write code, it is not instructions for the computer.
Rather, you are specifying something and Cue tells you if it is valid or not.
If this sounds weird right now, worry not, it becomes natural pretty quickly.
Under the hood, Cue analyzes your code with graph unification algorithms
based in part on NLP techniques from the 90's (pre deep learning).
Because of this,
you can spread configuration across directories and packages,
pulling common schema, constraint, logic, and values into
reusable modules.

#### _What is CUE?_

It's the new logical tool in your programming toolbox.
Cue will help you manage configuration, validate data,
share schemas, generate code, and much more.
Cue is still quite young and has a bright future.
I personally see it sweeping through the devops world first.
My hope is that you join us and bring your own use cases and ideas
to the community.


### What you need to dive in

You'll need a text editor and the `cue` cli.
If you haven't already, go ahead and download the
latest version from the [GitHub releases](https://github.com/cue-lang/cue/releases).
Beyond that, most examples will be run from the command line,
so a dedicated terminal is often helpful, but VS Code is just fine too.
If anything extra is needed for a particular section,
the instructions for it will be found there.


### Where to get help?

Several options are available

1. `cue help`, the builtin help command
2. [GitHub Discussions](https://github.com/cue-lang/cue/discussions) (trying to move here for longevity)
3. [Cuelang Slack](./https://app.slack.com/client/TLUV4Q1ST/CLT3ULF6C) (and the [invite if needed](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE))
4. [Hofstadter](/getting-help/#hofstadter-commercial-support-for-cue) offers commercial support and services for Cue

