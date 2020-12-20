str: "hello world"
num: 42
flt: 3.14

// Special field name (and a comment)
"k8s.io/annotation": "secure-me"

// lists can have different element types
list: [
	"a", "b", "c",
	1,
	2,
	3,
]

obj: {
	foo: "bar"
	// reuse another field?!
	L: list
}
