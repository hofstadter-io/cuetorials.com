// field attribute
foo: "bar" @attr()

// declaration attribute
foo: {
	@attr()
}

// they can have keys
any: _ @attr(foo,bar)

// keys have optional values
any: _ @attr(key1,key2=value,key3="foo;bar")
