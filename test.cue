// match everything
[key=string]: { name: key }
// regexp
[=~"b"]: { type: "b" }
// exact match, with key
[key="boo"]: "key": key

a0: key: 0
a1: key: 1
bar: val: 42
boo: val: "who"
"bool": val: false
boot: val: false

// this does not work
// [key=~"a"]: { type: "a" }
