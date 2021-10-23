s: "hello"
s: "world" // conflicting values "hello" and "world"

A: foo: "bar"
a: A.goo // undefined field A.goo (cue eval -c)

b: int // incomplete value (cue eval -c)

l: [1, 2]
l: [1, 3] // conflicting values 2 and 3

m: [1, 2]
v: m[2] // index out of range
