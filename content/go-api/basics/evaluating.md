---
title: "Evaluating Values"
weight: 50
---

{{<lead>}}
Evaluation is core CUE and powers everything from unification to validation.
This page will show you how to run the evaluator from Go and
configure the options to control its behavior.
{{</lead>}}



### Value.Validate()

Validate runs the evaluator on a value and returns an error.
We've seen the function used without arguments.
Validate will also use the many `cue.Option`s so you can control the process.
These are the same options used in `Value.Syntax(...Option)`.

{{< codePane2
	file1="code/go-api/basics/evaluating/validate.go"  lang1="go"  title1="validate.go"
	file2="code/go-api/basics/evaluating/validate.txt" lang2="txt" title2="go run validate.go"
>}}

[Validate Docs](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Validate)

__See [issue 1329](https://github.com/cue-lang/cue/discussions/1329) for a discussion on Options,
as they do not seem to all be used. These docs will be updated once there is more clarification.__



### Value.Unify()

Unify is the `&` from your CUE code and combines two values in the same way.
It returns the result of the unification.

{{< codePane2
	file1="code/go-api/basics/evaluating/unify.go"  lang1="go"  title1="unify.go"
	file2="code/go-api/basics/evaluating/unify.txt" lang2="txt" title2="go run unify.go"
>}}

[Unify Docs](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Unify)


### Value.Subsume()

Subsumption is a powerful technique which compares the relation of two values within the lattice.
`Subsume` will tell you if one value is an instance of another,
or to say it another way, if one value is backwards compatible with another.

{{< codePane2
	file1="code/go-api/basics/evaluating/subsume.go"  lang1="go"  title1="subsume.go"
	file2="code/go-api/basics/evaluating/subsume.txt" lang2="txt" title2="go run subsume.go"
>}}

[Subsume Docs](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Subsume)

__see [issue 1330](https://github.com/cue-lang/cue/discussions/1330) for a discussion on the output which seems to have inconsistencies__

### Value.Eval()

Eval will resolve references, ensure concreteness, uncover all errors and
generally finalizes a value, returning the result in a new value.

{{< codePane2
	file1="code/go-api/basics/evaluating/eval.go"  lang1="go"  title1="eval.go"
	file2="code/go-api/basics/evaluating/eval.txt" lang2="txt" title2="go run eval.go"
>}}

[Eval Docs](https://pkg.go.dev/cuelang.org/go@v0.4.0/cue#Value.Eval)

__There may be a bug in this function, see [issue 1326](https://github.com/cue-lang/cue/issues/1326)__



### Value.Evaluate()

This function has been proposed but does not exist yet.
It would take `...Option` like Validate and Syntax
and return a new Value after processing.

`func (v Value) Evaluate(opts ...Option) Value {...}`

If you find the new function helpful, please let the devs know
by contributing to [issue 1327](https://github.com/cue-lang/cue/issues/1327).
