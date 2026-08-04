// Code generated from envoy/config/endpoint/v3/endpoint_components.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

#Endpoint: {
	"@type":              "type.googleapis.com/envoy.config.endpoint.v3.Endpoint"
	address?:             v3_1.#Address
	health_check_config?: #Endpoint_HealthCheckConfig
	hostname?:            string
	additional_addresses?: [...#Endpoint_AdditionalAddress]
}

#Endpoint_HealthCheckConfig: {
	"@type":                      "type.googleapis.com/envoy.config.endpoint.v3.Endpoint.HealthCheckConfig"
	port_value?:                  uint32 & <=65535
	hostname?:                    string
	address?:                     v3_1.#Address
	disable_active_health_check?: bool
}

#Endpoint_AdditionalAddress: {
	"@type":  "type.googleapis.com/envoy.config.endpoint.v3.Endpoint.AdditionalAddress"
	address?: v3_1.#Address
}

#LbEndpoint: {
	"@type":                "type.googleapis.com/envoy.config.endpoint.v3.LbEndpoint"
	health_status?:         v3_1.#HealthStatus
	metadata?:              v3_1.#Metadata
	load_balancing_weight?: uint32 & >=1

	// oneof host_identifier: at most one may be set
	*{} |
	{endpoint!: #Endpoint} |
	{endpoint_name!: string}
}

#LbEndpointCollection: {
	"@type":  "type.googleapis.com/envoy.config.endpoint.v3.LbEndpointCollection"
	entries?: v3_2.#CollectionEntry
}

#LedsClusterLocalityConfig: {
	"@type":               "type.googleapis.com/envoy.config.endpoint.v3.LedsClusterLocalityConfig"
	leds_config?:          v3_1.#ConfigSource
	leds_collection_name?: string
}

#LocalityLbEndpoints: {
	"@type":   "type.googleapis.com/envoy.config.endpoint.v3.LocalityLbEndpoints"
	locality?: v3_1.#Locality
	metadata?: v3_1.#Metadata
	lb_endpoints?: [...#LbEndpoint]
	load_balancing_weight?: uint32 & >=1
	priority?:              uint32 & <=128
	proximity?:             uint32

	// oneof lb_config: at most one may be set
	*{} |
	{load_balancer_endpoints!: #LocalityLbEndpoints_LbEndpointList} |
	{leds_cluster_locality_config!: #LedsClusterLocalityConfig}
}

#LocalityLbEndpoints_LbEndpointList: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.LocalityLbEndpoints.LbEndpointList"
	lb_endpoints?: [...#LbEndpoint]
}
