// Code generated from envoy/service/discovery/v2/hds.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	endpoint_2 "envoyproxy.io/envoy-cue/spec/api/v2/endpoint"
)

#Capability: {
	"@type": "type.googleapis.com/envoy.service.discovery.v2.Capability"
	health_check_protocols?: [...#Capability_Protocol]
}

#Capability_Protocol: "HTTP" | "TCP" | "REDIS"

#HealthCheckRequest: {
	"@type":     "type.googleapis.com/envoy.service.discovery.v2.HealthCheckRequest"
	node?:       core_1.#Node
	capability?: #Capability
}

#EndpointHealth: {
	"@type":        "type.googleapis.com/envoy.service.discovery.v2.EndpointHealth"
	endpoint?:      endpoint_2.#Endpoint
	health_status?: core_1.#HealthStatus
}

#EndpointHealthResponse: {
	"@type": "type.googleapis.com/envoy.service.discovery.v2.EndpointHealthResponse"
	endpoints_health?: [...#EndpointHealth]
}

#HealthCheckRequestOrEndpointHealthResponse: {
	"@type":                   "type.googleapis.com/envoy.service.discovery.v2.HealthCheckRequestOrEndpointHealthResponse"
	health_check_request?:     #HealthCheckRequest
	endpoint_health_response?: #EndpointHealthResponse
}

#LocalityEndpoints: {
	"@type":   "type.googleapis.com/envoy.service.discovery.v2.LocalityEndpoints"
	locality?: core_1.#Locality
	endpoints?: [...endpoint_2.#Endpoint]
}

#ClusterHealthCheck: {
	"@type":       "type.googleapis.com/envoy.service.discovery.v2.ClusterHealthCheck"
	cluster_name?: string
	health_checks?: [...core_1.#HealthCheck]
	locality_endpoints?: [...#LocalityEndpoints]
}

#HealthCheckSpecifier: {
	"@type": "type.googleapis.com/envoy.service.discovery.v2.HealthCheckSpecifier"
	cluster_health_checks?: [...#ClusterHealthCheck]
	interval?: string
}
