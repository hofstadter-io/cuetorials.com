// ServiceStandard and ServiceDnsResolver are meant to be mutually exclusive:
// - If labels.dns-resolver is true, I force optionnal spec.selector to _|_
// - If type==ExternalName, I force optionnal spec.selector to _|_
// - If spec.selector exists, I force labels.dns-resolver to _|_ and type != ExternalName
// Will look for a better way to express this later.
#ServiceDnsResolver: {
	...
	metadata: {
		...
		labels: {
			...
			"dns-resolver": "true"
		}
	}
	spec: {
		...
		selector?: _|_
		type:      "ClusterIP"
	}
}
#ServiceExternalName: {
	...
	metadata: {
		...
		labels: {
			...
			"dns-resolver"?: _|_
		}
	}
	spec: {
		...
		selector?: _|_
		type:      "ExternalName"
	}
}
#ServiceWithSelector: {
	...
	metadata: {
		...
		labels: {
			...
			"dns-resolver"?: _|_
		}
	}
	spec: {
		...
		selector: {...}
		type: !~"ExternalName"
	}
}

#Service: {
	...
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		...
		labels: {
			...
			app: *"myapp" | string
		}
		namespace: "mynamespace"
	}
	spec: {
		...
		selector?: (*close({app: "myapp"}) | {...})
		type:      *"ClusterIP" | "LoadBalancer" | "NodePort" | "ExternalName"
	}
} & (#ServiceDnsResolver | #ServiceExternalName | #ServiceWithSelector)

// this one have label dns-resolverand no selector: Good
withdns: #Service & {
	metadata: labels: type:           "withdns"
	metadata: labels: "dns-resolver": "true"
}

// this one is ExternalName and without selector: Good
external: #Service & {
	metadata: labels: type: "external"
	spec: type: "ExternalName"
}

// this one have selector but no label dns-resolver and is not ExternalName: Good
withselector: #Service & {
	metadata: labels: type: "withselector"
	spec: selector: {x:     "y"}
	spec: type: "NodePort"
}

// this one have no label dns-resolver and is not ExternalName: Good
// default type is used
// I must force "selector" field to appear
withdefaultselector: #Service & {
	metadata: labels: type: "withselector"
	spec: selector: {}
}

/// // this one have both label dns-resolver and a selector, this is what I don't want: BAD
/// bad1: #Service & {
///  labels: type:           "bad1"
///  labels: "dns-resolver": true
///  spec: selector: {x: "y"}
/// }

/// // this one is ExternalName and a have selector, this is what I don't want: BAD
/// bad2: #Service & {
///  labels: type: "bad2"
///  spec: selector: {x: "y"}
///  spec: type: "ExternalName"
/// }

