#D: {
	labels: [=~"dev"]: string
}

d: #D & {
	labels: {
		// allowed
		"devUser": "foo"
		// not allowed
		"appUser": "bar"
	}
}
