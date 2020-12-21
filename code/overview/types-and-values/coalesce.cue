elems: ["a", "b", "c"]
a: *elems[0] | "A"
// out of bounds error
d: *elems[3] | "D"

S: {
	hello: "world"
}

// missing fields
s: *S.foo | "bar"
