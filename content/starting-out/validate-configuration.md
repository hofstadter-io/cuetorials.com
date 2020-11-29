---
title: "Validate Configuration"
description: "Validating existing configuration with Cue"
weight: 5
---

Validating existing configuration is one of the easiest ways to get started with Cue.
It is low impact and low risk as you are not changing anything you use today.
When we validate existing configuration, we are designing a schema and using Cue to test against it.

## A Simple Example

Let's start out with a simple example for an `album` object. Here we see the JSON and Cue representation for an album.

{{< chromaDouble lhsPath="code/starting-out/validate-configuration/album.json" lhsLang="json" lhsTitle="album.json" rhsPath="code/starting-out/validate-configuration/album.html" rhsTitle="album.cue" >}}


We start by defining a Cue `#Album` __definition__ or __schema__ which has the same structure.
Instead of setting the fields to data, we set them to types `string`.
Looking at the date field, we can see it repeated twice.
This enables us to accumulate constraints across locations in a file
or even across files and packages (how easier does applying company policies become?).
Define constraints on multiple lines is equivalent to using the conjunction operator (`&`)
and would look like `date: string & time.Format(...)`.
We add an additional __constraint__ using Cue's standard library.
We `import "time"` and use the `time.Format("format")` function to enforce
the syntax for dates. The format string used is the same as Go's.
You can learn more about how Go time formats work in the
[Go docs for time](https://golang.org/pkg/time/).
An important note to make about time formats is that the values used in the
format template string are very specific to Go's birth date/time.
(Mon Jan 2 15:04:05 MST 2006)
You can find more helpers in [Cue's standard library](https://pkg.go.dev/cuelang.org/go/pkg@v0.3.0-alpha5#section-directories),
just note that you cannot use the `tool/...` in normal Cue files.
They are reserved for the scripting layer we will cover in a few sections.

With our __schema__ `#Album` defined, we then assign it to an `album` field.
This is required in our setup because of the way we shaped our data
and the way Cue vet works. We'll see other styles as we continue.

Now we can validate our album JSON file.

```sh
cue vet album.json album-schema.cue
```

You should see no output. Let's see what an error looks like.
If we change the album year to a two-digit representation `97`
and run the same command, you should see the following error message:

```text
$ cue vet album-lhs.json album-validate.cue 
error in call to time.Format: invalid time "97-11-11"
```

<br>

## A Kubernetes Example

Let's validate the Kubernetes manifests for this website.
Below is the Yaml as a single file,
[you can find the originals in the repo](https://github.com/hofstadter-io/cuetorials.com/tree/main/ci/k8s).

{{< chromaCode lang="yaml" file="code/starting-out/validate-configuration/cuetorials.yaml" >}}

<br>

### Schema v1

As a first step, we setup some top-level __definitions__ for our Kubernetes resources.
We have a definition for each resource type and a `#Schema` which uses the disjunction operator (`|`) to
say the schema must unify with one of these entries, like an "or" statement.

{{< chromaHTML file="code/starting-out/validate-configuration/cuetorials-v1.html" >}}

Each resource type is defined as a `struct` (`{}`), defines fields for `apiVerions` and `kind`,
and leaves the definition open with the `...` (meaning more fields are allowed).
By default definitions are closed and any undefined fields will cause an error.
The `apiVersion` and `kind` fields are concrete values,
meaning the configuration we validate must match exactly.

Let's validate our Yaml with: 

```sh
cue vet cuetorials.yaml cuetorials.cue -d "#Schema"
```

The extra `-d "<path>"` tells Cue the value we want to use to validate
each Yaml entry against. We have to do this because Cue defaults
to using top-level information, but we have three different schemas, one for each resource,
and so we needed the disjunction and selector to make this work.

<br>

### Schema v2

Now that we have some boilerplate, let's define more schema to validate deeper into the objects.

{{< chromaHTML file="code/starting-out/validate-configuration/cuetorials-v2.html" >}}

Here are the things to pay attention to:

- We've specified more, but not all of the schema. We still have the `...`. To prevent extraneous fields, you have to remove it.
- The most general struct type is `{...}`. An empty struct looks like `{}`
- `labels: [string]: string` is called a "Template" in Cue and defines labels as a struct with string fields with string values. You could define the value to be something more complex.
- `ports: [...{...}]` is a list of structs. You can define a list of ints with `ints: [...int]`
- `namespace` and `annotations` have a `?` which makes them optional.

<br>

### Schema v3

You'll also notice in the last section that we had several schema sections which are repeated.
We can reduce this by introducing some reusable definitions for `label` and `metadata`.
The repeated sections are replaced with the definition label.

{{< chromaHTML file="code/starting-out/validate-configuration/cuetorials-v3.html" >}}


<br>

### Schema v4

Often, we want to ensure certain labels are specified and that
they match within different sections of a resource. We change the schema to:

- include `labels: app: string` to ensure an `app` label is on all resources. Notice that we can specify nested resources on a single line with `path: to: nested: value`.
- use `metadata.labels` on `#Deployment.spec.selector.matchLabels` and `#Service.spec.selector`. This ensures that the labels are the same between the respective sections of the resources.

{{< chromaHTML file="code/starting-out/validate-configuration/cuetorials-v4.html" >}}

<br>

### Final schema

There is much more we could do to fill out this schema.
We leave it as an exercise for the reader to add the details.
In particular, the `port` schema and cross validation will reinforce what we showed here.

