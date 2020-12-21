val: 42
A: {
	val: 23
	num: val // will be 23, matches locally

	// irregular names need to be quoted and require indexing to access
	"user-id": "abc"
	UserID: A["user-id"]
}
A: {
	b: val // 42, matches top-level
	c: A.num // 23, reference A.num
	// num itself is not in scope even though it is part of A
}
