package helm

chartName: string | *"all" @tag(chart)
chart: #resources | *charts[chartName]

charts: #charts & {
	app: [for _, R in APP { R }]
	db: [for _, R in DB { R }]
	all: [	
		for _, R in APP { R },
		for _, R in DB { R },
	]
}

APP: {
	ingress: #ingress & {
		name: "app"
		domain: "hof.io"
	}
	service: #service & {
		name: "app"
		port: "8080"
	}
	deploy: #deployment & {
		name: "app"
		image: "hof.io/app:lastest"
		#deps: [DB.deploy, DB.service]
	}
}

DB: {
	service: #service & {
		name: "db"
		port: "5432"
	}
	deploy: #deployment & {
		name: "psql"
		image: "postgres:13"
	}
}
