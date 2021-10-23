#Album: {
	artist: string
	title:  string
	year:   int

	// ...  uncomment to open, must be last
}

// This is a conjunction, it says "album" has to be "#Album"
album: #Album & {
	artist: "Led Zeppelin"
	title:  "Led Zeppelin I"
	year:   1969

	// studio: true  (uncomment to trigger error)
}
