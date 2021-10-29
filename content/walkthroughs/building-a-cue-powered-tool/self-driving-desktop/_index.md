---
title: "self-driving-desktop"
description: ""

---

{{<lead>}}
In this walkthrough, we will build a CUE powered tool called __self-driving-desktop__.
We will learn how to use the Go API, attributes, and modules to create
a program which can read CUE to drive your mouse and keyboard.
We will focus on defining the UX, or CUE code, and how to process the input.
Most of the application details are implemented in library we will use.
{{</lead>}}


### Overview

I previously wrote a Python program
[self-driving-desktop](https://github.com/hofstadter-io/self-driving-desktop)
to automate demo video creation.
Many found it useful for BPA
or copying data between applications
which lacked a programmable interface.
More recently, I came across
[go-vgo/robotgo](https://github.com/go-vgo/robotgo)
which is the equivalent library
to support a Go application.

What if we rebuilt this with
CUE and Go? We'd get...

- A binary that users can download
- Reusable components and libraries
- More sophistication and reslience
