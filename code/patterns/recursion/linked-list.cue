package llist

list: {
	val: _
	next: *null | list
}

ll1: list & { val: "a", next: list & { val: 1 } }

#LNS: list & {
	val: int
	let V = val
	if val > 0 {
		next: #LNS & { "val": V - 1 }
	}
}

lns1: #LNS & { val: 1 }
lns2: #LNS & { val: 2 }
lns3: #LNS & { val: 3 }
lns4: #LNS & { val: 4 }
