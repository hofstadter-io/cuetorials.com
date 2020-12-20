hello: "world"
hello: "world"

// set a type
s: { a: int }

// set some data
s: { a: 1, b: 2 }

// set a nested field without curly braces
s: c: d: 3

// lists must have the same elements
// and cannot change length
l: ["abc", "123"]
l: [
	"abc",
	"123"
]
