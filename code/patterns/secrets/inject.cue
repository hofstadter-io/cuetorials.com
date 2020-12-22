package inject

// @tag() is how we inject data
username: string @tag(username)
password: string @tag(password)

// A schema for DBs with some defaults
#DB: {
	host: string
	port: string | *"5432"
	db:   string | *"mydb"
	user: username
	pass: password

	// interpolate the fields into the connection string
	conn: "postgres://\(user):\(pass)@\(host):\(port)/\(db)"
}

// setup our databases
database: [Env=string]: #DB
database: {
	dev: host: "postgres.dev"
	stg: host: "postgres.stg"
	prd: host: "postgres.prd"
}
