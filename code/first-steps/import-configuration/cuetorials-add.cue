package cuetorials // alread there

import (
	apps "k8s.io/api/apps/v1"
	core "k8s.io/api/core/v1"
	extn "k8s.io/api/extensions/v1beta1"
)

deployment: [string]: apps.#Deployment
service: [string]: core.#Service
ingress: [string]: extn.#Ingress

// ...
