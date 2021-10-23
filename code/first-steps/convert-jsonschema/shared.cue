#shared: {
	name?:     string
	file?:     string
	external?: bool | {
		name?: string
		...
	}
	labels?:          #list_or_dict
	template_driver?: string
}
