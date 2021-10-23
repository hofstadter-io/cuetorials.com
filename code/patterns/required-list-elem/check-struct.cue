X: [{
	name: "a"
	val:  1
}, {
	name: "b"
	val:  2
}, {
	name: "c"
	val:  3
}]

#X: {
	for x in X {
		"\(x.name)": x
	}
}

#MustHave: ["b"]

#Xcheck: #X & {for x in #MustHave {"\(b)": _}}
