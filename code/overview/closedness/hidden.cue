#D: {
	size: string
	data: {
		x: int
		y: int
	}
}

// after conjuncting, extension is not allowed
d: #D & {
	data: {
		x: 3
		y: 4
	}

	_calc: data.x * data.y
	size:  string | *"med"
	if _calc < 10 {
		size: "small"
	}
	if _calc > 100 {
		size: "large"
	}
}
