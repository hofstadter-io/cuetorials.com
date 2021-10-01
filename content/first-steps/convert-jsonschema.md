---
title: "Convert JSON Schema"
description: "This tutorial show how to convert JSON Schema to Cuelang."
weight: 15
---

{{<lead>}}
JSON Schema is a widely used, but unwieldy schema and validation format.
CUE can import any JSON Schema, making it easier to read and maintain.
{{</lead>}}


### JSONSchema

A JSON Schema is just JSON itself. The difference is that
the Schema is a DSL (domain specific language),
meaning that it has special fields and a schema for itself. What inception!
When we import this into CUE, the `cue` cli will notice this and handle it differently.

We are going to use the `docker-compose` spec from [compose-spec](https://github.com/compose-spec/compose-spec).
You can find many more examples on the [Schema Store](https://www.schemastore.org/json/)
or use any custom ones you have around.

Download the `docker-compose` schema with this command:

```sh
wget https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json
```


<details>
  <summary class="h5">compose-spec.json (800+ lines)</summary>

{{< codePane file="code/first-steps/convert-jsonschema/compose-spec.json" title="compose-spec.json" lang="json">}}

</details>


<br>

### Converting to Cuelang

Converting JSON Schema to CUE is a one liner and a no brainer.

```sh
cue import -f -p compose -l '#ComposeSchema:' compose-spec.json
```

- `-f` forces overwriting the output file (compose-spec.cue)
- `-p` sets the package name in the output
- `-l` is the label to put the schema under
- the last argument is the input schema

We end up with about half as many lines. There are a lot of fields in a `docker-compose.yaml` file.

<details>
  <summary class="h5">compose-spec.json (400+ lines)</summary>

{{< codePane file="code/first-steps/convert-jsonschema/compose-spec.html" title="compose-spec.cue" >}}

</details>

<br>

### Drawbacks

CUE's ability to import JSON Schema makes it easy to get started.
However, the generated CUE doesn't always have the greatest ergonomics
for building up and validating values. This is often because the
source schema is underspecified or there are unusual types, like ports in Kubernetes.

The following are taken from the `docker-compose` output generated here.

##### Missing constraints

Sometimes a schema does not add validation. We know there is a fixed
format and valid versions for `docker-compose`

{{< codeInner >}}
#version?: string
{{< /codeInner >}}

__Any fields__

For more complex fields, we can end up with `_` (top)
and have no validation for the field at all.

{{< codeInner >}}
#constraints: _
{{< /codeInner >}}

__Duplication__

CUE cannot easily detect code duplication and shared structure
if it is not already present in the source schema.
The following show missed opportunity to have a more
succinct schema with CUE.


{{< codePane3
  file1="code/first-steps/convert-jsonschema/duplication.html" title1="duplication.cue"
  file2="code/first-steps/convert-jsonschema/shared.html" title2="shared.cue"
  file3="code/first-steps/convert-jsonschema/improved.html" title3="improved.cue"
>}}

This also happens with the `regexp` for the fields near the top like services and volumes.
