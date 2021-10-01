	#secret: {
		#shared

		driver?: string
		driver_opts?: {
			{[=~"^.+$" & !~"^()$"]: number | string}
			...
		}

		{[=~"^x-" & !~"^(name|file|external|labels|driver|driver_opts|template_driver)$"]: _}
	}

	#config: {
		#shared

		{[=~"^x-" & !~"^(name|file|external|labels|template_driver)$"]: _}
	}

