// Definition of an infinite linked list
#List: {
	data: _
	next: #List | *null
	// note, the default to null is required
	// otherwise it looks like a cyclic reference
}

// manually construct a linked list
l: #List & {data: 1, next: #List & {data: 2}}

ds: [1, 2, 4, 8]
// comprehend a linked list from some data
ll: [ for i, d in ds {
	data: d
	if i < len(ds)-1 {
		next: ll[i+1] // note how we reference "future" list elements!
	}
}]

L: ll[0] // we really only want the first element
