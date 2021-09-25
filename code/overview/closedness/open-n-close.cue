S: close({
	name: string
	point: {
		x: int
		y: int
	}
})

s: S & { 
	// this is no longer allowed
	data: bytes
	// this is still allowed
	point: z: int
}

#D: {
	name: string
	data: {
		num: int
		...
	}
	...
}

// this is now allowed
d: #D & {
	meta: string	
	data: {
		val: string
	}
}
