---
title: "Overview"
description: "A quick overview of Cue"
weight: 5
---


### JSON Superset


### Types are Values


### The Lattice


### Defining Fields

- duplicate
- folding


### Constraints


### Definitions


### Conjunctions


### Disjunctions


### Defaults


### Incomplete and Concrete


### Open and Closed


### Building Up Values


### Order is Irrelevant


### Turing-Incomplete

Cue is Turing-incomplete, meaning you will not program like typical languages.
Rather, you will provide values, types, definitions, and constraints;
and Cue will tell you if what you have written is correct.
This choice is intentional and based on years of experience
managing configuration at Google.

The main ideas are:

- wrap code in data, not data in code
- no primitive recursion or inheritance
- the initial learning curve is worth the long-term maintenance

The main inspirations are:

- Difficulties with Borgcfg and GCL as complexity grew
- Lingo and Typed Feature Structure Grammars
- Logical and functional languages

