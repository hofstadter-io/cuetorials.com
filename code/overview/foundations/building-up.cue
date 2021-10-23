#Base: {
	name: string
	kind: string
}

#Meta: {
	// string and a semver regex
	version: string & =~"^v[0-9]+\\.[0-9]+\\.[0-9]+$"
	// list of strings
	labels: [...string]
}

#Permissions: {
	role:   string
	public: bool | *false
}

// Building up a schema using embeddings
#Schema: {
	// embed other schemas
	#Base
	#Meta

	#Permissions
	// with no '...' this is final
}

value: #Schema & {
	name:    "app"
	kind:    "deploy"
	version: "v1.0.42"
	labels: ["server", "prod"]
	role: "backend"
	// public: false  (by default)
}
