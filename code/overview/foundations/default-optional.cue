s: {
	// field with a default
	hello: string | *"world" | "apple"
	// an optional integer
	count?: int

	// uncomment to cause failure when not supplied
	// needed!: _|_
}
