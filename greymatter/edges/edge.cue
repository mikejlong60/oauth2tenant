package oauth2tenant

import (
	gsl "greymatter.io/gsl/spec/v1"
	"oauth2tenant.module/greymatter:globals"
	policies "oauth2tenant.module/greymatter/policies"
)

edge: gsl.#Edge & {
	context: edge.#NewContext & globals

	name:            "edge"
	display_name:    "oauth2tenant edge"
	version:         "v2.5.0"
	description:     "No description fred"
	business_impact: "high"
	owner:           "oauth2tenant"
	capability:      ""
	api_endpoint:    ""

	resources: gsl.#ResourceQuotas & {
		requests: {
			cpu:    "100m"
			memory: "128Mi"
		}
		limits: {
			cpu:    "300m"
			memory: "1000Mi"
		}
	}

	gateways: [
		gsl.#LoadBalancer & {
			targetListeners: [
				{name: "edge", exposedPort: 10909},
			]
		},
	]
	volumes: [
		{
			name: "oauth2"
				secret: {
					secretName: "greymatter-oauth2-secret"
					optional:   true
				}
		},
	]

	volumeMounts: [
		{
			name: "oauth2"
			mountPath: "/etc/proxy/tls/oauth2"
		}
	]

	ingress: {
		"edge": {
			gsl.#HTTPListener
			gsl.#TLSListener

			port: 443
			filters: [
				gsl.#OIDCPipelineV2 & {
					#options: {
							oauth2: config: {policies.OAuthProvider}
							jwt: {policies.JWKSProvider} // Omit this line if there is no JWKS Provider
					}
				},
				gsl.#GreymatterWAFFilter & {
					config: {
						directives: [
							{
								inline_string: policies.DefaultWafConfig
							},
						]
					}
				},
			]
		}

		"service-info": gsl.#ServiceInfo & {
			gsl.#SpireListener & {
				#context: context.SpireContext
				#subjects: ["prometheus"]
			}
		}
	}

	raw_upstreams: {
		"oauth2": {
			gsl.#Upstream
			gsl.#TLSUpstream
			instances: [
				{
					host: "172.18.0.5"
					port: 443
				},
			]
		}
	}
}

exports: "edge": edge
