---
title: "Switch Statement"
description: "Simulating switch statements in CUE"
weight: 7
---


### The pattern

We can use list comprehensions to simulate a switch statement.

{{< codePane file="code/patterns/switch/pattern.html">}}

This pattern has an number of `if` conditions or guards in a list
and then selects the `[0]` element.
By doing so, we emulate a switch statement from other languages.
Be advised that all conditional statements will be evaulated.


### A basic example

This example demonstrates turning a integer into a string describing
its numerical classification.

{{< codePane2
  file1="code/patterns/switch/switch.html" title1="switch.cue" play1="true"
  file2="code/patterns/switch/switch.json" title2="cue export switch.cue" lang2="json"
>}}

### Order matters

In the `order` example, we show our work by breaking down the pattern.
While a "true" prefix has the correct result, we can see that
when `a` and `b` are the same, HasPrefix still matches
and we get the less accurate result.

{{< codePane2
  file1="code/patterns/switch/order.html" title1="order.cue" play1="true"
  file2="code/patterns/switch/order.json" title2="cue export order.cue" lang2="json"
>}}

### An uncovered case errors

We can modify our first example to demonstrate what happens
when you forget the default, or otherwise fail to cover all conditions.

{{< codePane2
  file1="code/patterns/switch/uncovered.html" title1="uncovered.cue" play1="true"
  file2="code/patterns/switch/uncovered.sh" title2="cue export uncovered.cue" lang2="shell"
>}}

### All conditions are evaluated

You might expect the following to work rather than error.
This is the result of all conditions being evaulated.
That is, there is not short-circuit to the evaluation.

{{< codePane2
  file1="code/patterns/switch/conditions.html" title1="conditions.cue" play1="true"
  file2="code/patterns/switch/conditions.sh" title2="cue export conditions.cue" lang2="shell"
>}}

