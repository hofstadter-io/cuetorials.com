---
title: Configuration
weight: 10
---

### The Loading Configuration

Cue's `load.Instances` has a second argument for configuring options.
The CLI, it uses the command, flags, and args to set these values.
When we load with Go, we can setup this `Config` object to modify the behavior.

{{< cuedoc page="/cue/load#Config" >}}load.Config{{</cuedoc>}} documentation

The comments there explain how to use the various options.
Most are for advanced use cases and will make more sense
once you have seen more of Cue.
Others you have seen as flags to the CLI.

