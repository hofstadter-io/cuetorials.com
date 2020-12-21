#schema: {
	word: string
	num: int | *42
	optional?: string
}

value: #schema & {
	word: "what's the good?"
}
