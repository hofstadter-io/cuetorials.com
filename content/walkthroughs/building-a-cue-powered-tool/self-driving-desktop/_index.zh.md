---
title: "自驱动桌面"
description: ""

---

{{<lead>}}

在这个最佳实践中，我们将使用 CUE 构建一个名为 __自驱动桌面__ 的强大工具。

我们将学习如何使用 Go API，属性和 module 来创建一个程序，可以使用 CUE 获取你的鼠标和键盘。

我们专注于定义 UX、 CUE 代码以及如何处理输入。

大部分细节已经在我们用的库中实现了。 
{{</lead>}}


### 概述

我之前写了一个 python 程序 [self-driving-desktop](https://github.com/hofstadter-io/self-driving-desktop) 来自动演示创建 demo 视频。

许多人觉得它对于 BPA 或者在缺少可编程接口的应用程序之间复制数据非常有用。

最近，我发现 [go-vgo/robotgo](https://github.com/go-vgo/robotgo) 是在 Go 中实现的一样的库。

如果我们使用 CUE 和 Go 来重构呢？我们将会得到：

- 用户可以下载的二进制文件
- 可复用的组件和库
- 更成熟和更易扩展
