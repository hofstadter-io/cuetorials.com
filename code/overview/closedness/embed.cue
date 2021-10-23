#D: {
	name: string
	data: {
		num: int
	}
}

// embed D into a new defintion
#L: {
	#D
	tags: [...string]
}

// after conjuncting, extension is not allowed
d: #L & {
	meta: "meta"
	data: {
		num: 3
	}
	tags: ["foo", "bar"]
}
