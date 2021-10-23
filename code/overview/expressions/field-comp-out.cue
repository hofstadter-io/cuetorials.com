apps: ["nginx", "express", "postgres"]
#labels: {}
stack: {
	nginx: {
		name: "nginx"
		labels: {
			app:  "foo"
			tier: "0"
		}
	}
	express: {
		name: "express"
		labels: {
			app:  "foo"
			tier: "1"
		}
	}
	postgres: {
		name: "postgres"
		labels: {
			app:  "foo"
			tier: "2"
		}
	}
}
