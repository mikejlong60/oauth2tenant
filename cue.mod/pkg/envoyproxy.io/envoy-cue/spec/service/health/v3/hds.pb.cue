// Code generated from envoy/service/health/v3/hds.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/endpoint/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
)

#Capability: {
	"@type": "type.googleapis.com/envoy.service.health.v3.Capability"
	health_check_protocols?: [...#Capability_Protocol]
}

#Capability_Protocol: "HTTP" | "TCP" | "REDIS"

#HealthCheckRequest: {
	"@type":     "type.googleapis.com/envoy.service.health.v3.HealthCheckRequest"
	node?:       v3_1.#Node
	capability?: #Capability
}

#EndpointHealth: {
	"@type":        "type.googleapis.com/envoy.service.health.v3.EndpointHealth"
	endpoint?:      v3_2.#Endpoint
	health_status?: v3_1.#HealthStatus
}

#LocalityEndpointsHealth: {
	"@type":   "type.googleapis.com/envoy.service.health.v3.LocalityEndpointsHealth"
	locality?: v3_1.#Locality
	endpoints_health?: [...#EndpointHealth]
}

#ClusterEndpointsHealth: {
	"@type":       "type.googleapis.com/envoy.service.health.v3.ClusterEndpointsHealth"
	cluster_name?: string
	locality_endpoints_health?: [...#LocalityEndpointsHealth]
}

#EndpointHealthResponse: {
	"@type": "type.googleapis.com/envoy.service.health.v3.EndpointHealthResponse"
	endpoints_health?: [...#EndpointHealth]
	cluster_endpoints_health?: [...#ClusterEndpointsHealth]
}

#HealthCheckRequestOrEndpointHealthResponse: {
	"@type": "type.googleapis.com/envoy.service.health.v3.HealthCheckRequestOrEndpointHealthResponse"

	// oneof request_type: at most one may be set
	*{} |
	{health_check_request!: #HealthCheckRequest} |
	{endpoint_health_response!: #EndpointHealthResponse}
}

#LocalityEndpoints: {
	"@type":   "type.googleapis.com/envoy.service.health.v3.LocalityEndpoints"
	locality?: v3_1.#Locality
	endpoints?: [...v3_2.#Endpoint]
}

#ClusterHealthCheck: {
	"@type":       "type.googleapis.com/envoy.service.health.v3.ClusterHealthCheck"
	cluster_name?: string
	health_checks?: [...v3_1.#HealthCheck]
	locality_endpoints?: [...#LocalityEndpoints]
	transport_socket_matches?: [...v3_3.#Cluster_TransportSocketMatch]
	upstream_bind_config?: v3_1.#BindConfig
}

#HealthCheckSpecifier: {
	"@type": "type.googleapis.com/envoy.service.health.v3.HealthCheckSpecifier"
	cluster_health_checks?: [...#ClusterHealthCheck]
	interval?: string
}

#HdsDummy: {
	"@type": "type.googleapis.com/envoy.service.health.v3.HdsDummy"
}
