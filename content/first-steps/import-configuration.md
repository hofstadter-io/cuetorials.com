---
title: "Import Configuration"
description: "Import existing configuration into Cue"
weight: 10
---

To save you time, effort, and mistakes,
Cue has some commands to import and minimize
your existing configurations into Cue.

## Importing configuration

`cue import` will process files and directories of Yaml and JSON
into Cue values. There are many flags for controlling how this happens
and how the output is organized.

Let's continue with our Cuetorials Kubernetes example.
Run the following command in the same directory as the `cuetorials.yaml` file:

```sh
cue import -f -o cuetorials.cue -l 'strings.ToLower(kind)' -l 'metadata.name' -p cuetorials cuetorials.yaml
```

- `-f` overwrites the output file
- `-o` sets the output filename
- `-l` tells Cue how to name the values in the output so that they do not collide. Here we are using `<kind>: <name>: {...}`
- `-p` tells Cue to put the output in `package cuetorials`
- the last argument is our file, but can also be a glob or directories (`./...`)

{{< chromaHTML file="code/first-steps/import-configuration/cuetorials-import.html" >}}

<br>

## Importing Go to Cue

Cue can turn Go types into Cue definitions.
This is helpful when you have existing code
and you want to validate Yaml or JSON that
will be unmarshaled into these types.
You can also generate Go helpers functions for validating these types
from the Cue schema (see [Cuelang docs](https://cuelang.org/docs/integrations/go/#generate-go-code), requires writing go).

Before we can import Go to Cue,
we need to setup a file needed for Cue modules to work.
We'll talk about modules and packages in
[an upcoming section](/first-steps/modules-and-packages),
for now create the following file `cue.mod/module.cue`:

{{< chromaHTML file="cue.mod/module.html" >}}

With that in place, what we are going to do is:

1. Download the Kubernetes API code (you need a local copy)
2. Import the Go into Cue definitions
3. Apply the Kubernetes Cue to our Cuetorials Cue 
4. Validate that our config complies with the Kubernetes spec

```sh
# "go get" the Kubernetes code
go get k8s.io/api/... k8s.io/apimachinery/...

# "cue go get" to import into Cue defs
cue get go k8s.io/api/... k8s.io/apimachinery/...

# inspect what "cue get go" into the cue.mod/gen directory
tree cue.mod/gen/
```

Now add the following lines to your `cuetorials.cue` file:

{{< chromaHTML file="code/first-steps/import-configuration/cuetorials-add.html" >}}

Now try running `cue eval cuetorials.cue`. You are likely to see some errors.
This is because Kubernetes acccepts both strings and integers in several places.
To fix these, add the `IntVal: <#>` before the integer (or `StrVal:` if you are using a different yaml that has strings).

- `deployment >>> rollingUpdate`
- `deployment >>> httpGet`
- `service >>> targetPort`
- `ingress >>> servicePort`

Once you get `cue eval` working (printing out Cue values)
you can run `cue trim` on the file to remove redundent code
(based on minimization and defaults).
Advanced trimming is on the roadmap for Cue via _anti-unification._

{{< chromaHTML file="code/first-steps/import-configuration/cuetorials-trimmed.html" >}}

You may be saying, “this wackiness about int/str ports does not match my kubernetes files”
and you are totally right. We’ll see later how to work with OpenAPI specs and more
in the integrations sections.
