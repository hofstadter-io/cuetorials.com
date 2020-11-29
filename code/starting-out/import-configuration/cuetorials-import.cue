package cuetorials

deployment: cuetorials: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      "cuetorials"
		namespace: "websites"
		labels: app: "cuetorials"
	}
	spec: {
		selector: matchLabels: app: "cuetorials"

		strategy: {
			type: "RollingUpdate"
			rollingUpdate: {
				maxSurge:       1
				maxUnavailable: 0
			}
		}
		minReadySeconds: 5

		template: {
			metadata: labels: app: "cuetorials"
			spec: containers: [{
				name:            "website"
				image:           "us.gcr.io/hof-io--develop/cuetorials.com:manual"
				imagePullPolicy: "Always"
				ports: [{
					containerPort: 80
					protocol:      "TCP"
				}]

				readinessProbe: {
					httpGet: port: 80
					initialDelaySeconds: 6
					failureThreshold:    3
					periodSeconds:       10
				}
				livenessProbe: {
					httpGet: port: 80
					initialDelaySeconds: 6
					failureThreshold:    3
					periodSeconds:       10
				}
			}]
		}
	}
}
service: cuetorials: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      "cuetorials"
		namespace: "websites"
		labels: app: "cuetorials"
	}
	spec: {
		selector: app: "cuetorials"
		type: "ClusterIP"
		ports: [{
			port:       80
			targetPort: 80
		}]
	}
}
ingress: cuetorials: {
	apiVersion: "extensions/v1beta1"
	kind:       "Ingress"
	metadata: {
		name:      "cuetorials"
		namespace: "websites"
		labels: app: "cuetorials"
		annotations: {
			"kubernetes.io/tls-acme":                         "true"
			"kubernetes.io/ingress.class":                    "nginx"
			"nginx.ingress.kubernetes.io/force-ssl-redirect": "true"
			"cert-manager.io/cluster-issuer":                 "letsencrypt-prod"

			"kubernetes.io/configuration-snippet": """
				location ~* \\.(?:css|js|jpg|jpeg|gif|png|ico|cur|gz|svg|svgz|mp4|ogg|ogv|webm|htc)$ {
				  expires 1h;
				  access_log off;
				  add_header Cache-Control \"public\";
				}
				location / {
				  expires -1;
				}

				"""
		}
	}

	spec: {
		tls: [{
			hosts: [
				"cuetorials.com",
			]
			secretName: "cuetorials-tls"
		}]

		rules: [{
			host: "cuetorials.com"
			http: paths: [{
				backend: {
					serviceName: "cuetorials"
					servicePort: 80
				}
			}]
		}]
	}
}
