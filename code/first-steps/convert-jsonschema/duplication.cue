	#secret: {
		name?:     string
		file?:     string
		external?: bool | {
			name?: string
			...
		}
		labels?: #list_or_dict
		driver?: string
		driver_opts?: {
			{[=~"^.+$" & !~"^()$"]: number | string}
			...
		}
		template_driver?: string

		{[=~"^x-" & !~"^(name|file|external|labels|driver|driver_opts|template_driver)$"]: _}
	}

	#config: {
		name?:     string
		file?:     string
		external?: bool | {
			name?: string @deprecated()
			...
		}
		labels?:          #list_or_dict
		template_driver?: string

		{[=~"^x-" & !~"^(name|file|external|labels|template_driver)$"]: _}
	}

