---
title: Concurrency
---

CUE's evaluator is not concurrency safe yet.
This means you cannot evaluate two values in parallel,
for example using CUE in API handlers.

Note that this only applies when using CUE from Go.
In the meantime, you need to put locks around the evaluator.

Concurrent and parallel calls will eventually be supported.
You can find more information at these links.

- [Making CUE safe for concurrency](https://github.com/cue-lang/cue/discussions/613)
- [How do I use CUE concurrently](https://github.com/cue-lang/cue/discussions/1205)
- [GitHub Issues](https://github.com/cue-lang/cue/labels/concurrency)

