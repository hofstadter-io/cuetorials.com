---
title: "Switch Statement"
description: "Simulating switch statements in CUE"
weight: 7
---


### The pattern

We can use list comprehensions to simulate a switch statement.

{{< chromaHTML file="code/patterns/switch/pattern.html">}}

This pattern has an number of `if` conditions or guards in a list
and then selects the `[0]` element.
By doing so, we emulate a switch statement from other languages.
Be advised that all conditional statements will be evaulated.


### A basic example

This example demonstrates turning a integer into a string describing
its numerical classification.

{{< chromaDouble
  lhsPath="code/patterns/switch/switch.html" lhsTitle="switch.cue"
  rhsPath="code/patterns/switch/switch.json" rhsTitle="cue export switch.cue" rhsLang="json"
>}}

### Order matters

In the `order` example, we show our work by breaking down the pattern.
While a "true" prefix has the correct result, we can see that
when `a` and `b` are the same, HasPrefix still matches
and we get the less accurate result.

{{< chromaDouble
  lhsPath="code/patterns/switch/order.html" lhsTitle="order.cue"
  rhsPath="code/patterns/switch/order.json" rhsTitle="cue export order.cue" rhsLang="json"
>}}

### An uncovered case errors

We can modify our first example to demonstrate what happens
when you forget the default, or otherwise fail to cover all conditions.

{{< chromaDouble
  lhsPath="code/patterns/switch/uncovered.html" lhsTitle="uncovered.cue"
  rhsPath="code/patterns/switch/uncovered.sh" rhsTitle="cue export uncovered.cue" rhsLang="shell"
>}}

### All conditions are evaluated

You might expect the following to work rather than error.
This is the result of all conditions being evaulated.
That is, there is not short-circuit to the evaluation.

{{< chromaDouble
  lhsPath="code/patterns/switch/conditions.html" lhsTitle="conditions.cue"
  rhsPath="code/patterns/switch/conditions.sh" rhsTitle="cue export conditions.cue" rhsLang="shell"
>}}

