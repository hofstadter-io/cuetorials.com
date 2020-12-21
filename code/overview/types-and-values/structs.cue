// an open struct
a: {
	foo: "bar"
}

// shorthand nested field
a: hello: "world"

// a closed struct
b: close({
	left: "right"
})

// error, field up not allowed
b: up: "down"
