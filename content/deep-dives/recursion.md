---
title: "递归"
---

{{<lead>}}
CUE does not permit general recursion. It intends to be **Turing Incomplete**.
That being said, there are some forms of recursion that can be represented.
{{</lead>}}


### Structural Recursion

CUE also disallows cyclic references.
However, this does not prevent us from defining infinite structures
such as linked lists or binary trees.
We call this [structural recursion](https://en.wikipedia.org/wiki/Recursion_\(computer_science\)#Structural_versus_generative_recursion),
where the process works on a finite piece of data.

{{< codePane2
	file1="code/deep-dives/recursion/linked-list.html" title1="linked-list.cue" play1="true"
	file2="code/deep-dives/recursion/ll-out.html" title2="cue eval linked-list.cue"
>}}


### Bounded Recursion

Bounded recursion is a limited form of general or generative recursion.
The problem CUE has with general recursion is that it becomes difficult or impossible
to run the evaluator and verify your CUE code.
Bounded recursion puts a limit on recursion depth,
thus making the problem _not_ infinite and permissable under CUE's philosophy.
There were some comments made about permitting bounded general recursion
in: https://github.com/cue-lang/cue/issues/990

In the mean time, and as a thought experiment,
you can simulate bounded recursion with a comprehension
and a function generator.
You can find the following code and examples,
as well as many more "recursive" structural helpers,
in [the Cuetils project on GitHub](https://github.com/hofstadter-io/cuetils).
There you will also find Go versions of these functions.
_For any serious usage, it is highly recommended to use
a language with proper general recursion support.
Cuetils provides these same helpers as a Go package
that supports CUE values as arguments._
Expect performance issues when using the CUE version
of RecurseN and the "recursive" functions built with it.

{{< codePane file="code/deep-dives/recursion/recurse.html" title="recurse.cue" play="true" >}}

{{< codePane file="code/deep-dives/recursion/depth.html" title="depth.cue" play="true" >}}

Note the `{(#next & {#in: v}).out}` in the `let depths = ...` line.
This is "recursion" or really the reference from one of the generated "functions" to the next.

- todo, show what an unrolled `#Depth` value looks like, this should help with understanding

We should be clear, there are no functions or calls or recursion happening here.
What we are really doing is taking an incomplete definition and creating a sequence of them,
which refer to their neighbors (the for comp in #RecurseN).
It's a way to reduce the writing, but each "function" has its own label and is a separate value.
So we are essentially unrolling a "bounded recursion" into struct fields with a field (for) comprehension,
and using a index suffix to name them so they are independent values.

##### Some more examples:


{{< codePane file="code/deep-dives/recursion/pick.html" title="pick.cue" play="true" >}}
{{< codePane file="code/deep-dives/recursion/diff.html" title="diff.cue" play="true" >}}

