---
title: "Foundations"
description: "Foundations for Cue"
weight: 5
---


### JSON Superset

Cue is a superset of JSON, it includes everything JSON has and then adds some extras.
This means Cue can read all JSON and represent it, while not all Cue is representable as JSON.
Rest assured this is a good thing because it makes using Cue familiar and also more expressive.
When representing JSON in Cue, the differences are:

- There are `// single line comments`
- Objects are called structs
- Object members are called struct fields
- Quotes can be omitted for field names without special characters
- You don't need commas after struct fields
- You can place a comma after the last element in a list
- The outermost curly braces are optional


{{< codePane2
  file1="code/overview/foundations/superset.html" title1="superset.cue" play1="true"
  file2="code/overview/foundations/superset.json" title2="cue export superset.cue" lang2="json"
>}}


### The Lattice

Every instance lives somewhere in Cue's __Value Lattice__.
The most open value is "top" or `_` which matches any instance.
The most restricted value is "bottom" or `_|_` and represents
invalid instances, conflicts, and errors.
Every other instance is in between, and partially ordered
when compared to other instances.
This may sound confusing right now, but will become clearer
as you learn and use Cue more.
It's based on some mathematical concepts you can learn more about in the [theory section](/theory/).
For now, consider `top -> schema -> constraint -> data -> bottom`
as a rough guide with instances becoming more concrete until there is an error.


### Types are Values

If you think about JSONSchema vs JSON, they are separate concepts.
One defines a schema, the other is data. In Cue they are the same.

Cue merges types and values into a single concept, the value lattice.
This gives us the ability to
define schemas, refine with constraints, fill with data,
and combine these ideas along a spectrum.
It also means defining schemas is more natural with how we think about and write code as humans.

{{< codePane3
  file1="code/overview/foundations/tav-schema.html"    title1="Schema"
  file2="code/overview/foundations/tav-constrain.html" title2="Constraints"
  file3="code/overview/foundations/tav-data.html"      title3="Data"
>}}

While you're likely familiar with types and data,
most languages do not make constraints or validation
a first-class concept.
Cue does, with constraints, which place rules or restrictions on values.
Like all instances, they live in the __value lattice__
between schemas and fully specified values.

Cue's best practice has us start with open schemas, limit possibilities in context,
and eventually arrive at a concrete instances.
You'll also want to start with small schemas and build them up into more complex instances.


### Values Cannot Be Changed

One of the most important aspects of Cue to understand is that __values cannot be changed__.
There are no overloads or overrides in Cue.
This has implications on how you write and organize code.
The reason is for maintainability and comprehension, but is also required by Cue's philosophy.
You will find this useful if you've ever wondered where else some value in your
configuration was set from. Cue will not only guarantee that it is the value you set it to,
it will also tell you where it was set and other locations if there is a conflict.


### Defining Fields

Cue allows fields to be defined more than once
as long as they are consistent with each other.

- basic data types must be the same
- you can make a field more restrictive, but not the other way
- structs fields are merged, list elements must match exactly
- the rules are applied recursively

{{< codePane2
  file1="code/overview/foundations/fields.html"      title1="fields.cue" play1="true"
  file2="code/overview/foundations/fields-eval.html" title2="cue eval fields.cue"
>}}

Using these properties will be
useful for defining schemas in one place, constraints in another, building up configuration,
and ensuring that a field was not incorrectly set to different values in different places.


### Definitions

Definitions are Cue's way of specifying schemas.
They have slightly different rules from structs.

- They are not output as data
- They may remain incomplete or under specified
- They "close" a struct, forbidding unknown or additional fields

You indicate a definitions with `#mydef:` and can leave it open with `...`

{{< codePane2
  file1="code/overview/foundations/definition.html" play1="true" title1="definition.cue"
  file2="code/overview/foundations/definition.json" lang2="json" title2="cue export definition.cue"
>}}


### Conjunctions

Conjunctions "meet" values together, combining their fields, rules, and data.
They are like "and" and the `&` operator is used for them.

{{< codePane2
  file1="code/overview/foundations/conjunction.html" play1="true" title1="conjunction.cue"
  file2="code/overview/foundations/conjunction.json" lang2="json" title2="cue export conjunction.cue"
>}}


### Disjunctions

Disjunctions "join" values to create options or alternatives.
They are like "or" and the `|` operator is used for them.

{{< codePane2
  file1="code/overview/foundations/disjunction.html" play1="true" title1="disjunction.cue"
  file2="code/overview/foundations/disjunction.json" lang2="json" title2="cue export disjunction.cue"
>}}

Disjunctions have several uses:

- enums (as values)
- sum-type (any of these types)
- null-coalescing (use this computation, or default to some value)


### Defaults and Optionals

Cue supports setting defaults for values or marking a field optional.

{{< codePane2
  file1="code/overview/foundations/default-optional.html" play1="true" title1="default-optional.cue"
  file2="code/overview/foundations/default-optional.json" lang2="json" title2="cue export default-optional.cue"
>}}


### Incomplete and Concrete

An incomplete value is one which does not have all fields filled with data.
Cue will not export incomplete values and instead return an error.
By contrast, concrete is a fully specified value.

### Open and Closed

Open means a struct can be extended, closed means they cannot.
By default structs are open and definitions are closed.
Cue also allows us to explicitly do the opposite.

{{< codePane
  file="code/overview/foundations/open-closed.html" title="open-closed.cue"
>}}


### Building Up Values

In Cue, it is recommended to start small and build values up.
This makes schemas reusable. You can do this by embedding values.

{{< codePane2
  file1="code/overview/foundations/building-up.html" play1="true" title1="building-up.cue"
  file2="code/overview/foundations/building-up.json" lang2="json" title2="cue export building-up.cue"
>}}

### Order is Irrelevant

Cue's unification system resolves values, schemas, and constraints
regardless of order and which files may contain them.

{{< codePane3
  file1="code/overview/foundations/order.html"     title1="order.cue"
  file2="code/overview/foundations/order-2.html"   title2="crder-2.cue"
  file3="code/overview/foundations/order-out.html" title3="cue export order.cue order-2.cue"
>}}

More generally, unification is associative, commutative and idempotent.


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

The main inspirations for these restrictions are:

- Difficulties with Borgcfg and GCL as complexity grew (i.e. object oriented and lambdas)
- Lingo and Typed Feature Structure Grammars (managing massive configurations)
- Logical and functional languages (various pieces like comprehensions in immutability)


### Foundations in Golang

Cue started as a fork of Go mainly to simplify the bootstrapping of a new language.
Marcel is also a member of the Go team at Google and many philosophies carry over:

- Cue is implemented in Go
- Rich tooling in an awesome CLI
- APIs for working with the language
- A standard library included


