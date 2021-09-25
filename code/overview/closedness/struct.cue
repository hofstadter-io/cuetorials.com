S: {
	name: string
	point: {
		x: int
		y: int
	}
}

// we can extend the fields
s: S & { 
	data: bytes
	point: z: int
}
