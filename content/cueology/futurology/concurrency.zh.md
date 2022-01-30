---
title: 并发
---

CUE 的求值器是非并发安全的。

这意味着你不能同时计算两个值，例如在 API handler 中使用 CUE。

注意这个只在 Go 中使用 CUE 生效，同时，你需要在使用求值器前后使用锁。

并发或并行调用最终将会支持，你可以在下面的链接中查看更多信息。

- [让 CUE 并发安全](https://github.com/cuelang/cue/discussions/613)
- [我如何并发地使用 CUE](https://github.com/cue-lang/cue/discussions/1205)
- [GitHub Issues](https://github.com/cue-lang/cue/labels/concurrency)

