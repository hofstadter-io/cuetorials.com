---
title: "Building CUE powered tools"
description: "Walkthroughs and examples for building Cuelang powered tools using the Go API."

---

{{<lead>}}
This section of the walkthroughs is about building CUE powered tools.
{{</lead>}}

{{<lead>}}
There are largely two halves to this.
First, we need to define the UX, or CUE code, that users will write.
This is similar to designing DSLs.
Second, we need to process user input to achieve some outcome.
The Go API, attributes, and modules are central to this.
Along the way, we will see the best practices for building CUE powered tools.
{{</lead>}}


These are a few of the benefits to using CUE
as the input for your own applications:

- better than config formats like JSON or Yaml
- better than a custom DSL or language
- you can get reusable code, definitions, and modules for free.
- you can move a lot of application logic into CUE


{{<childpages>}}

