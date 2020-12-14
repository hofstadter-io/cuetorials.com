#Base: {
	name: string
	kind: string
	... // so it can be extended
}
#Meta: {
	// string and a semver regex
	version: string & =~"^v[0-9]+\\.[0-9]+\\.[0-9]+$"
	// list of strings
	labels: [...string]
}

#Permissions: {
	role: string
	public: bool | *false
}

// Building up a schema using a conjunction and embedding
#Schema: #Base & {
	// "embed" meta and permissions
	#Meta
	#Permissions
	// with no '...' this is final
}

value: #Schema & {
	name: "app"
	kind: "deploy"
	version: "v1.0.42"
	labels: ["server", "prod"]
	role: "backend"
	// public: false  (by default)
}
