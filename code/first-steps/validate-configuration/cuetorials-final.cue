#Schema: #Deployment | #Service | #Ingress

#Deployment: {
	apiVersion: "apps/v1"
	kind: "Deployment"
	metadata: #metadata
	spec: {
		selector: {...}
		strategy: {...}
		minReadySeconds: uint
		template: {
			metadata: {
			labels: #labels
			}
			spec: {...}
		}
	}
	...
}

#Service: {
	apiVersion: "v1"
	kind: "Service"
	metadata: #metadata
	spec: {
		selector: #labels
		type: string
		ports: [...{...}]
	}
	...
}

#Ingress: {
	apiVersion: "extensions/v1beta1"
	kind: "Ingress"
	metadata: #metadata
	spec: {...}
	...
}

#metadata: {
	name: string
	namespace?: string
	labels: #labels
	annotations?: [string]: string
}

#labels: [string]: string
