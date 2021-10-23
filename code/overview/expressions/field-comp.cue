apps: ["nginx", "express", "postgres"]
#labels: [string]: string
stack: {
	for i, app in apps {
		"\(app)": {
			name:   app
			labels: #labels & {
				app:  "foo"
				tier: "\(i)"
			}
		}
	}
}
