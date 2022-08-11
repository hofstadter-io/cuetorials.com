package inject

// @tag() is how we inject data
env:      *"dev" | string @tag(env)      // env has a default
database: string          @tag(database) // database is "required"

// A schema for DBs with some defaults
#DB: {
	host: #hosts[env]
	port: string | *"5432"
	db:   database

	// interpolate the fields into the connection string
	conn: "postgres://\(host):\(port)/\(db)"
}

// setup our database host mapping
#hosts: [string]: string
#hosts: {
	dev: "postgres.dev"
	stg: "postgres.stg"
	prd: "postgres.prd"
}
