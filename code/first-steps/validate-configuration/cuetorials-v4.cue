#Schema: #Deployment | #Service | #Ingress

#labels: [string]: string
#labels: app:      string

#metadata: {
	name:       string
	namespace?: string
	labels:     #labels
	annotations?: [string]: string
}

#Deployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   #metadata
	spec: {
		selector: {
			matchLabels: metadata.labels
		}
		strategy: {...}
		minReadySeconds: uint
		template: {...}
	}
	...
}

#Service: {
	apiVersion: "v1"
	kind:       "Service"
	metadata:   #metadata
	spec: {
		selector: metadata.labels
		type:     string
		ports: [...{...}]
	}
	...
}

#Ingress: {
	apiVersion: "extensions/v1beta1"
	kind:       "Ingress"
	metadata:   #metadata
	spec: {...}
	...
}
