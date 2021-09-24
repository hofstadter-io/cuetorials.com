import "strings"

#compare: {
	a: string
	b: string
	l: [
		if strings.HasPrefix(b, a) { "prefix" }
		if a == b { "same" }
		"none"
	]
	result: l[0]
}

ex1: (#compare & {a: "a", b: "abc"})
ex2: (#compare & {a: "abc", b: "abc"})
