package fill

#A: {
	a: {
		foo: string
		nested: {
			hello: string
			... // need to open this nested struct so we can add a field during fill
		}
	}
}

hello: "world"

b: {
	foo: "bar"
}

B: {
	foo: "bar"
	hello: "world"
}
