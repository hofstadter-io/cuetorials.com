---
title: "Scripts & Tasks"
description: "Patterns for making and using scripts and tasks in CUE (cmd)"
weight: 20
---

CUE's scripting layer is built on top of
{{< cuedoc page="/tools/flow">}}tools/flow{{</cuedoc>}}.
In this area, you can define tasks with CUE which
interact with the outside world. In other words,
where non-hermetic operations are allowed.

### Enforce Dependencies

`cue/flow` can automatically infer task dependencies
based on references between their values.
Tasks, where all tasks it dependens have on have completed,
are available to run.

{{< codePane file="code/patterns/scripts-and-tasks/autodep_tool.html" title="autodep_tool.cue" >}}

But what happens when there is no dependency,
yet the order is important?

{{< codePane file="code/patterns/scripts-and-tasks/unenforced_tool.html" title="unenforced_tool.cue" >}}

{{< codeInner lang="sh" title="$ cue write">}}
task failed: open out/write/foo.txt: no such file or directory
{{< /codeInner >}}

The above code may or may not have this output,
as both tasks are available to run and the
script is non-deterministic.

When this situation arises,
we need to tell `cue/flow` that
a dependency between the tasks exists
by making an explicit reference.
This is like "using" the output from a first task
in the second task, but actually ignoring the output.

{{< codePane file="code/patterns/scripts-and-tasks/enforced_tool.html" title="enforced_tool.cue" >}}

This new version, with `$dep: mkdir.$done` is
guaranteed to have consistent and correct order.

### Comprehending Tasks

Another common pattern in scripting and tasks are

- running tasks for each entry in a list or map
- conditionally running a task

We can use CUE's comprehenesion capabilities
for both of these, even together.

{{< codePane file="code/patterns/scripts-and-tasks/comprehend_tool.html" title="comprehend_tool.cue" >}}




### Reusable Scripts and Tasks

We can define reusable tasks,
though some extra care is needed when using them.
Additionally we can create values containing
many tasks and even import them.

The follow does not work because we reference a single field
within the task, but never the full task value.
`cue cmd` only runs tasks which are eventually nested under
the root value of the command you run.

{{< codePane file="code/patterns/scripts-and-tasks/brokenref_tool.html" title="brokenref_tool.cue" >}}

To fix this, we use _localized references_ to
add the task within the task to run.
Note, this can be used to import tasks which import tasks, ad infinitum,
as long as every task has _localized references_ to the tasks it depends on.

{{< codePane file="code/patterns/scripts-and-tasks/localref_tool.html" title="localref_tool.cue" >}}

### Importing Tasks

Importing tasks works around two things:

1. `_tool.cue` files cannot be imported
2. tasks packages can only be imported in `_tool.cue` files.

Instead, we code with care and

1. Put reusable tasks in regulare `.cue` files
2. Skip importing the packages and schemas 
3. Use the `$id` field and ensure the other fields are correct

{{< codePane file="code/patterns/scripts-and-tasks/import_tool.html" title="import_tool.cue" >}}
{{< codePane file="code/patterns/scripts-and-tasks/load/secret.html" title="load/secret.cue" >}}
{{< codePane file="code/patterns/scripts-and-tasks/utils/dir.html" title="utils/dir.cue" >}}

### hof/flow

At Hofstadter, we are building a custom task engine on `cue/flow`.
It adds task analytics, visualization, distributability,
and many additional task types.

- [docs tbd...] see the following for now
- https://github.com/hofstadter-io/hof/tree/_dev/flow/testdata
- https://github.com/hofstadter-io/flow-examples
- https://github.com/hofstadter-io/flows
- https://github.com/verdverm/streamer-tools

