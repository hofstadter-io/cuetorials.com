#Schema: #Deployment | #Service | #Ingress

#Deployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:       string
		namespace?: string
		labels: [string]:       string
		annotations?: [string]: string
	}
	spec: {
		selector: {
			matchLabels: [string]: string
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
	metadata: {
		name:       string
		namespace?: string
		labels: [string]:       string
		annotations?: [string]: string
	}
	spec: {
		selector: [string]: string
		type: string
		ports: [...{...}]
	}
	...
}

#Ingress: {
	apiVersion: "extensions/v1beta1"
	kind:       "Ingress"
	metadata: {
		name:       string
		namespace?: string
		labels: [string]:       string
		annotations?: [string]: string
	}
	spec: {...}
	...
}
