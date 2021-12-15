---
title: "Generate All The Things"
description: "Generating non-configuration with Cue"
keywords:
- code generation
- template
- hof
- hofstadter
weight: 90
---

Cue really shines with configuration management and
solves a lot of fundamental problems we have with current options.
And while this is going to be Cue's primary use case for most people,
you can actually generate pretty much anything.

How? By using `text/templates` to render any file we wish.

### Generating with Cue

{{< codePane file="code/first-steps/generate-all-the-things/first.html" title="first.cue" play="true">}}

{{< codePane file="code/first-steps/generate-all-the-things/first_tool.html" title="first_tool.cue">}}

```sh
cue cmd -t "name=bob" gen
```

Cue's template system is Go's template system,
so all of the capabilities and rules are the same.
We've used both list and field comprehension
to define render and write our templates respectively.
With sophisticated Cue definitions, values, and templates
you can generate any output that Cue does not map onto natively.


### Generating with Hof

At Hofstadter, we built `hof` as a custom tool for sophisticated code generation.
We wanted a single source of truth for our models which we could turn into
the source code for databases, servers, and frontend which implement a full stack app.
We think of it as a "high code" (~~low code~~) solution for developers.
Cue was chosen as the UX/DX for writing the input (designs)
and the generators which `hof` processes.

The two problem with previous systems are:

1. You always end up writing custom code in the generated output
2. Your designs evolve but you've already generated the boilerplate

The solution is actually pretty simple, keep a shadow copy of the generated code
and use a 3-way diff to merge design updates and custom code.

##### With the following two files in a directory, run `hof mod vendor cue` and `hof gen`

{{< codePane file="code/first-steps/generate-all-the-things/cue.mods" title="cue.mods" lang="text">}}

{{< codePane file="code/first-steps/generate-all-the-things/hof.html" title="hof.cue">}}

You can learn more about `hof` from these links:

- https://github.com/hofstadter-io/hof
- https://docs.hofstadter.io

There are also a number of "hofmod" repos for generating CLIs, APIs, and more.
The separation of `hofmod`'s from the `hof` tool means that you can create your own without needing to change our code.
Because they are also Cue modules, you have all the power of Cue and
can import them for reusing or extending your own generators and projects.
