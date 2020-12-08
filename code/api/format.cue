package hello

hello: "world"

#A: {
	foo: string
}

_hid: {
	see: false
}

// to cause a load error, remove the '&'
// to cause a build error, change '#A' to '#B'
// to cause a validation error, change foo to '1'
a: #A & {
	foo: "bar"
}
