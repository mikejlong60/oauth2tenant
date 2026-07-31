package oauth2tenant

import (
	gsl "greymatter.io/gsl/spec/v1"
	"oauth2tenant.module/greymatter:globals"
	wafpolicies "oauth2tenant.module/greymatter/policies"
)

edge: gsl.#Edge & {
	context: edge.#NewContext & globals

	name:            "edge"
	display_name:    "oauth2tenant edge"
	version:         "v2.5.0"
	description:     "No description"
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

	ingress: {
		"edge": {
			gsl.#HTTPListener
			gsl.#TLSListener

			filters: [
				gsl.#GreymatterWAFFilter & {
					config: {
						directives: [
							{
								inline_string: wafpolicies.DefaultWafConfig
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
}
