package oauth2tenant

import (
	gsl "greymatter.io/gsl/spec/v1"
	"oauth2tenant.module/greymatter:globals"
)

service1: gsl.#Service & {
	context: service1.#NewContext & globals

	name:            "service1"
	display_name:    "oauth2tenant nginx"
	version:         "v1.0.0"
	description:     "No description"
	business_impact: "low"
	owner:           "oauth2tenant"
	capability:      ""
	api_endpoint:    ""

	resources: gsl.#ResourceQuotas & {
		requests: {
			cpu:    "100m"
			memory: "128Mi"
		}
		limits: {
			cpu:    "200m"
			memory: "200Mi"
		}
	}

	ingress: {
		"service1": {
			gsl.#HTTPListener
			gsl.#SpireListener & {
				#context: context.SpireContext
				#subjects: ["oauth2tenant-edge"]
			}

			filters: [
				gsl.#LuaFilter & {
					#options: {
						inline_code:
							"""
							function envoy_on_request(request_handle)
								local headers = request_handle:headers()
								-- Get the 'cookie' header
								local cookie = headers:get("cookie")
								if cookie then
									-- Extract the token from a cookie named "Token"
									local token = string.match(cookie, "token=([^;]+)")
									if token then
										local auth_value = "Bearer " .. token
										headers:replace("Authorization", auth_value)
									else
										request_handle:logInfo("No 'Token' cookie found in cookie header.")
									end
								else
									request_handle:logInfo("No 'cookie' header found in request.")
								end
							end
							"""
					}
				},
			]

			routes: {
				"/": {
					upstreams: {
						"127.0.0.1:8080": {
							gsl.#Upstream

							instances: [
								{
									host: "127.0.0.1"
									port: 8080
								},
							]
						}
					}
				}
			}
		}

		"service-info": gsl.#ServiceInfo & {
			gsl.#SpireListener & {
				#context: context.SpireContext
				#subjects: ["prometheus"]
			}
		}
	}

	edge: {
		edge_name: "edge"
		routes: {
			"/services/oauth2tenant/service1": {
				prefix_rewrite: "/"

				upstreams: {
					"service1": {
						gsl.#Upstream
						gsl.#SpireUpstream & {
							#context: {
								globals.globals
								service_name: "edge"
							}

							#subjects: ["oauth2tenant-service1"]
						}

						namespace:       "oauth2tenant"
						target_listener: "service1"
					}
				}
			}
		}
	}
}

exports: "oauth2tenant": oauth2tenant