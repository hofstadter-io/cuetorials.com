#D: {
	name: string
	data: {
		num: int
	}
}

// you can split the spec, this is not extension
#D: tags: [...string]

// after conjuncting, extension is not allowed
d: #D & {
	meta: string
	data: {
		val: string
	}
}
