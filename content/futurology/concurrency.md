---
title: Concurrency
---

CUE's evaluator is not concurrency safe yet.
This means you cannot evaluate two values in parallel,
for example using CUE in API handlers.

This will eventually change and overlaps with other issues
like structural sharing.
