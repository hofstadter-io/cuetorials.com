s: "hello"
s: "world"    // conflicting values "hello" and "world"

A: foo: "bar"
a: A.goo     // undefined field A.goo (cue eval -c)

l: [1,2]
l: [1,3]     // conflicting values 2 and 3
v: l[2]      // index out of range
