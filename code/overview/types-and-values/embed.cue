#A: {
	num: number
}

#B: {
	ans: string
}

// this won't work
#bad: #A & #B
bad: #bad & {
	num: 42
	ans: "life"
}

// but this will
#val: { #A, #B }
val: #val & {
	num: 42
	ans: "life"
}
