#OneOf: { a: string } | { b: string }

#E: {
	name: string
	#OneOf
}

ex1: #E & {
	name: "a choice"
	a:  "bar"
}

ex2: #E & {
	name: "b choice"
	b:  "hello"
}

ex3: #E & {
	name: "error none chosen"
}

ex4: #E & {
	name: "error both chosen"
	a: "a"
	b: "b"
}
