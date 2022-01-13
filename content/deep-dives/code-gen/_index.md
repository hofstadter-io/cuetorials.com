---
title: Code Gen

---

There are several types of "code gen" in relation to CUE

Configuration or data (yaml,json)

- __Export__: CUE -> data (cue export)
- __Import__: data -> CUE (cue import)

Language types:

- __Get Go__: Go -> CUE   (cue get go)
- __TypeGen__: CUE -> Go   (... custom ...)

_some notes:
(1) CUE only has support for importing Go right now
(2) CUE only imports types from Go
(3) CUE does not have functions, so we cannot represent those in CUE without a DSL_

{{<childpages>}}
