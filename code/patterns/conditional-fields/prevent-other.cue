// Should be oneOf?


#A: {
	spec: {
	    type:  *"ClusterIP" | "NodePort"
	    ...
	}
	labels: [string]: string
	labels: app: "APP"
    if (labels."dns-resolver") != _|_ {
        spec: selector: close({})
    }
    ...
}

// this one has a label dns-resolver and no selector: Good
withdns: #A & {
	labels: type:           "withdns"
	labels: "dns-resolver": "true"
}

// this one have selector but no label dns-resolver: Good
withselector: #A & {
	labels: type: "withselector"
	spec: selector: {x: "y"}
	type: "NodePort"
}

// this one have both label dns-resolver and a selector, this is what I don't want: BAD
bad1: #A & {
	labels: type:           "bad1"
	labels: "dns-resolver": "true"
	// spec: selector: {x: "y"}
}
