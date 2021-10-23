package stdlib

import "strings"

s: "HelloWorld"

u: strings.ToUpper(s)
l: strings.ToLower(s)

line:  "Cue stands for configure, unify, execute"
words: strings.Split(line, " ")
lined: strings.Join(words, " ")

haspre: strings.HasPrefix(line, "Cue")
index:  strings.Index(line, "unify")
