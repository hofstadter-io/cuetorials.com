// Given the original definition
#D: {
	a: int
}

// And a downstream usage
foo: #D & {
	#bar: int
}

// The original could be chagned to
#D: {
	a:    int
	#bar: string
}
