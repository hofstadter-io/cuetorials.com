package foobar

#Def: {
	in: {
		key: string
	}

	out: {
		secret: in.key
	}
}

Foo: {
	params: {
		bar: (#Def & { in: { vars } }).out
	}
}
