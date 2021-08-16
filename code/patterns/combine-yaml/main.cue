#User: {
	name: string
	site: string
	website: #Website & websites["\(site)"]
}

#Website: {
	name: string
	url: string
}

users: [string]: #User

websites: [Name=string]: #Website & {
	name: Name
}
