---
title: "Dependency Management"
---

While CUE has modules and packages,
it does not yet have a system
for dependency management.
The proposed system very closely
mirrors Go's system.

You can read more in the
[package management proposal](https://github.com/cue-lang/cue/issues/851).

In the meantime, there are two methods
for managing dependencies

1. Using scripts to fetch them into the `cue.mod/pkg` folder
2. Using `hof mod` generic MVS dependency management system.

See [first-steps/modules-and-packages](/first-steps/modules-and-packages/)
for an example of `hof mod`.
