#First: {
	foo: string
}

#Other: {
	msg: string
}

#Either: #First | #Other

#Thing: {
	name: string
	#Either
}

thing1: {
	name: "thing1"
	foo:  "bar"
}

thing2: {
	name: "thing2"
	msg:  "hello"
}
