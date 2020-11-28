#A: {
	*{b: *"b" | string} | {c: string}
}
#B: {
	a: #A
}
map2: [string]: #B & {
	a: *(#A & {
		c: *"foo" | string
	}) | _
	// when _ is replaced with #A it works
	// but `#B.a` should be #A so _ is #A ?!
}
map2: bar1: a: c: "bar1"
map2: bar2: a: _
map2: bar3: a: b: "bar3"
