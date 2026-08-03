// Code generated from envoy/api/v2/endpoint/endpoint_components.proto. DO NOT EDIT.
package endpoint

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#Endpoint: {
	"@type":              "type.googleapis.com/envoy.api.v2.endpoint.Endpoint"
	address?:             core_1.#Address
	health_check_config?: #Endpoint_HealthCheckConfig
	hostname?:            string
}

#Endpoint_HealthCheckConfig: {
	"@type":     "type.googleapis.com/envoy.api.v2.endpoint.Endpoint.HealthCheckConfig"
	port_value?: uint32 & <=65535
	hostname?:   string
}

#LbEndpoint: {
	"@type":                "type.googleapis.com/envoy.api.v2.endpoint.LbEndpoint"
	endpoint?:              #Endpoint
	endpoint_name?:         string
	health_status?:         core_1.#HealthStatus
	metadata?:              core_1.#Metadata
	load_balancing_weight?: uint32 & >=1
}

#LocalityLbEndpoints: {
	"@type":   "type.googleapis.com/envoy.api.v2.endpoint.LocalityLbEndpoints"
	locality?: core_1.#Locality
	lb_endpoints?: [...#LbEndpoint]
	load_balancing_weight?: uint32 & >=1
	priority?:              uint32 & <=128
	proximity?:             uint32
}
