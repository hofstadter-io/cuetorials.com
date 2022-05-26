#Album: {
	artist: string
	title:  string
	year:   int

	// ...  // 2. uncomment to open and fix error, must be last
}

// This is a conjunction, it says "album" has to be "#Album"
album: #Album & {
	artist: "Led Zeppelin"
	title:  "Led Zeppelin I"
	year:   1969

	// studio: true  // 1. uncomment to trigger error
}
