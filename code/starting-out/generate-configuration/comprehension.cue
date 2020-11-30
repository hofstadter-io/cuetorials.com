import "strings"

band: {
	name: "Led Zeppelin"

	// List comprehension
	selfTitled: [ for i, I in _selfIndexAlbums { title: "\(name) \(I)" } ]
	// nested list comprehension
	allAlbums: [
		for I in _selfIndexAlbums { title: "\(name) \(I)" },
		for N in _namedAlbums { title: "\(N)" },
	]

	Albums: {
		// Field comprehension 
		for key, val in allAlbums {
			"\(strings.TrimSpace(val.title))": {
				pos: key
				artist: name
				title: strings.TrimSpace(val.title)
				titleLen: len(val.title)
			}
		}
	}

	// Hidden fields
	_selfIndexAlbums: ["", "II", "III", "IV"]
	_namedAlbums: [
		"Houses of the Holy",
		"Physical Graffiti",
		"Presence",
		"In Through the Out Door",
		"Coda"
	]
}
