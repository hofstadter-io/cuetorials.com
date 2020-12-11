package helm

#resource: #ingress | #service | #deployment
#resources: [...#resource]
#charts: [string]: #resources

#base: {
	name: string
	#deps: [...#resource]
}

#ingress: {
	#base
	domain: string
}

#service: {
	#base
	port: string
}

#deployment: {
	#base
	image: string
}

