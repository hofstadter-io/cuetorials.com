---
title: "Introduction"
description: "Introduction to Cuelang"
weight: 1
---

### About this tutorial

Welcome to __Cuetorials__ where you can
_learn you some Cue for great good!_
We hope this site will help you get started with Cue
and that it becomes an invaluable resource as you become more versed.

I am writing this to help you learn Cue while also learning more myself.
Cue fascinated me the first time I saw it. #Futurology!
Cue's logical foundation took me back to Prolog
and it's application to managing configuration was timely.
I had just hacked imports into yaml, sat back and said "this is a bad idea..."
Cue stuck out from the alternatives for it's philosophy and heritage. 
Cue has now become the central UX to the [hof tool](https://github.com/hofstadter-io/hof).

Much credit must be given to Marcel van Lohuizen, the creator of Cue.
Marcel helped in making the configuration systems at Google.
He says that they always chose the object-oriented approach
and that the logical, non-programming Cue approach
is the correct choice for configuration systems.


### So what is Cue?

Cue is purpose built logical language for working with data and much more.
Most people start with Cue by validating and generating configuration.
They then move on to data templating, runtime input validation,
code generation, scripting, pipelines, and oh so much more
which we'll cover throughout.

Cue is __not__ a general purpose language
and instead aims for __Turing-incompleteness__.
The underlying philosophy is that it is
harder for both humans and tooling to understand
configuration and data that has been programmed together.
The saying is "Wrap code in data, not data in code."

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

[[ insert diagrams for simple examples here ]]

<blockquote class="blockquote text-center">
<b>CUE stands for Configure, Unify, Execute.</b>
</blockquote>

With Cue, when you write code, it is not instructions for the computer.
Rather, you are specifying something and Cue tells you if it is valid or not.
If this sounds weird right now, worry not, it becomes natural pretty quickly.
Under the hood, Cue analyzes your code with graph unification algorithms
based in part on NLP techniques from the 90's (pre deep learning).
Because of this,
you can spread configuration across directories and packages,
pulling common schema, constraint, logic, and values into
reusable modules.

#### _So what is Cue?_

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
latest version from the [GitHub releases](https://github.com/cuelang/cue/releases).
Beyond that, most examples will be run from the command line,
so a dedicated terminal is often helpful, but VS Code is just fine too.
If anything extra is needed for a particular section,
the instructions for it will be found there.


### Where to get help?

I'm glad you asked!

1. `cue help`, the builtin help command
2. [GitHub Discussions](https://github.com/cuelang/cue/discussions) (trying to move here for longevity)
3. [Slack](./https://app.slack.com/client/TLUV4Q1ST/CLT3ULF6C) (and the [invite if needed](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE))


