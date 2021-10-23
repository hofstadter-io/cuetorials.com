import "list"

#elem: {
	key: string
	val: _
}

elems: [...#elem] & [
	{key: "a", val: 1},
	{key: "b", val: 1},
	{key: "a", val: 2},
	{key: "b", val: 1},
]

// we compare the current element and add it if it does not appear in the remainder of the list
// in doing so, we add the last unique occurance to the result
uniq: [ for i, x in elems if !list.Contains(list.Drop(elems, i+1), x) {x}]
