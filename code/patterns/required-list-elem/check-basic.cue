X: [1, 2, 4]

#X: {
	for x in X {
		"\(x)": x
	}
}

#MustHave: [3]

#Xcheck: #X & {for x in #MustHave {"\(x)": x}}
