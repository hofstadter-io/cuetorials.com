#List: {
	val: _
	next: #List | *null
}

// Cannot do this, it is structural recursion
#Contains: {
	list: #List
	val: _
	found: bool | *false

	if list.val == val {
		found: true
	}
	if list.val != val && list.next != null {
		// No recursion!
		found: #Contains & { "list": list.next, "val": val }
	}
}

// We can define an infinite structure
list: #List & { val: "a", next: { val: "b" } }

// results in
list: {
	val: "a"
	next: {
		val:  "b"
		next: null
	}
}
