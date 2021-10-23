package configmap

import "encoding/base64"

#ConfigMap: {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata:
				name: string
	labels: [string]: string
	data: [string]:   string
}

#Secret: {
	apiVersion: "v1"
	kind:       "Secret"
	metadata:
				name: string
	labels: [string]: string
	data: [string]:   string
	#data: [string]:  string
	data: {for k, v in #data {"\(k)": base64.Encode(null, v)}}
}

s: #Secret & {
	metadata: name: "creds"
	#data: {
		username: "bob"
		password: "foobar"
	}
}
