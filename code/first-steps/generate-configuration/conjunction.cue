#labels: [string]: string

#metadata: {
	name: string
	// we can explicitly prevent namespace by commenting it out and ensuring this definition is closed
	// namespace?: string
	labels: #labels
	annotations?: [string]: string
}

// require the following keys for labels
#requiredLabels: #labels & {
	app:  string
	env:  string
	team: string
}

// for env, limit the choices and default to dev with '*'
#defaultLabels: #requiredLabels & {
	env: *"dev" | "stg" | "prd"
}

// set concrete values to be reused
#myLabels: #defaultLabels & {
	app:  "cuetorials"
	team: "hofstadter"
}

// our Kubernetes definitions from before
#Schema: #Deployment | #Service | #Ingress

// Additionally apply our labels buildup to the resources
#Schema: {
	metadata: #metadata & {
		labels: #myLabels
	}
}

#Deployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	...
}

#Service: {
	apiVersion: "v1"
	kind:       "Service"
	...
}

#Ingress: {
	apiVersion: "extensions/v1beta1"
	kind:       "Ingress"
	...
}
