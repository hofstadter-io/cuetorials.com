package app

secrets: {
	username: string
	password: string
}

app: {
	creds: {
		user: secrets.username
		pass: secrets.password
	}
}
