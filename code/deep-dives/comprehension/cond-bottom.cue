a: {
	p?: int
}

// if b is concrete, add config
if a.b != _|_ {
	b: "found"
}
// you can also check optional fields
if a.p != _|_ {
	p: a.p & >1024
}

// if c is not concrete, add config
if a.c == _|_ {
	c: "missing"
}

// you cannot set a value if it is not present
// a: {
// 	d: _
// 	if d == _|_ {
// 		d: "default"
// 	}
// }

// use preference marks (defaults) for that instead
a: {
	d: _ | *"default"
}
