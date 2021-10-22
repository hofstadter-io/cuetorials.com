---
title: "Evaluating Values"
weight: 50
---

{{<lead>}}
Evaluation is core CUE and powers everything from unification to validation.
This page will show you how to run the evaluator from Go and
configure the options to control its behavior.
{{</lead>}}



### Value.Eval()

Eval will resolve references, ensure concreteness, uncover all errors and
generally finalizes a value, returning the result in a new value.

{{< codePane2
	file1="code/go-api/basics/evaluating/eval.go"  lang1="go"  title1="eval.go"
	file2="code/go-api/basics/evaluating/eval.txt" lang2="txt" title2="go run eval.go"
>}}



### Value.Validate()

Validate runs the evaluator on a value and returns an error.
It has many `cue.Option`s so you can control the process.

{{< codePane2
	file1="code/go-api/basics/evaluating/validate.go"  lang1="go"  title1="validate.go"
	file2="code/go-api/basics/evaluating/validate.txt" lang2="txt" title2="go run validate.go"
>}}



### Value.Unify()

Unify is the `&` from your CUE code and combines two values in the same way.
It returns the result of the unification.

{{< codePane2
	file1="code/go-api/basics/evaluating/unify.go"  lang1="go"  title1="unify.go"
	file2="code/go-api/basics/evaluating/unify.txt" lang2="txt" title2="go run unify.go"
>}}



### Value.Subsume()

Subsumption is a powerful technique which compares the relation of two values within the lattice.
`Subsume` will tell you if one value is an instance of another,
or to say it another way, if one value is backwards compatible with another.

{{< codePane2
	file1="code/go-api/basics/evaluating/subsume.go"  lang1="go"  title1="subsume.go"
	file2="code/go-api/basics/evaluating/subsume.txt" lang2="txt" title2="go run subsume.go"
>}}

