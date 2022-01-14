---
title: "Known Issues"
description: "Known issues in CUE and Cuelang with links to GitHub for tracking"
weight: 20
---

### Errors

- [1319: Not all errors printed](https://github.com/cue-lang/cue/issues/1319)
- [1093: Error flags not working](https://github.com/cue-lang/cue/issues/1093)
- There are many issues regarding accuracy or correctness of the error message
- Also see futurology for the custom error message proposal

### Root Value

Generally the root value is not accessible.

This plays into the `-e` flag and quoted identifiers like `"dashed-id": 42`.
These cannot be referenced from the command line.
The CLI may be changed to allow a special way to access the root scope
so that these values can be accessed.

[See issue #358](https://github.com/cue-lang/cue/issues/358)


### Encoders

There are a number of issues with encoders,
largely around inconsistent behavior.


### Playground

The playground does not have exact parity with the CLI.
If you have an issue there, you should confirm it also
exists with the `cue` CLI.

