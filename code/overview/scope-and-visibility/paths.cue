A: {
	a: "A"
	"2f": 3
	l: ["cow", "moo"]
}

a: {
	// either is valid
	f1: A.a
	f2: A["a"]
	// must index
	f3: A["2f"]
	// list index
	f4: A.l[1]
}
