package app

_secrets: {
	username: string
	password: string
}

app: {
	creds: {
		user: _secrets.username
		pass: _secrets.password
	}
}
