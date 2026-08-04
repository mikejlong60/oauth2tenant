// Code generated from envoy/config/core/v3/health_check.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#HealthStatusSet: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HealthStatusSet"
	statuses?: [...#HealthStatus]
}

#HealthCheck: {
	"@type":                      "type.googleapis.com/envoy.config.core.v3.HealthCheck"
	timeout!:                     string // TODO(pgv): duration bounds
	interval!:                    string // TODO(pgv): duration bounds
	initial_jitter?:              string
	interval_jitter?:             string
	interval_jitter_percent?:     uint32
	unhealthy_threshold!:         uint32
	healthy_threshold!:           uint32
	alt_port?:                    uint32
	reuse_connection?:            bool
	no_traffic_interval?:         string // TODO(pgv): duration bounds
	no_traffic_healthy_interval?: string // TODO(pgv): duration bounds
	unhealthy_interval?:          string // TODO(pgv): duration bounds
	unhealthy_edge_interval?:     string // TODO(pgv): duration bounds
	healthy_edge_interval?:       string // TODO(pgv): duration bounds
	event_log_path?:              string
	event_logger?: [...#TypedExtensionConfig]
	event_service?:                    #EventServiceConfig
	always_log_health_check_failures?: bool
	always_log_health_check_success?:  bool
	tls_options?:                      #HealthCheck_TlsOptions
	transport_socket_match_criteria?: {...}

	// oneof health_checker: exactly one must be set
	{http_health_check!: #HealthCheck_HttpHealthCheck} |
	{tcp_health_check!: #HealthCheck_TcpHealthCheck} |
	{grpc_health_check!: #HealthCheck_GrpcHealthCheck} |
	{custom_health_check!: #HealthCheck_CustomHealthCheck}
}

#HealthCheck_Payload: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HealthCheck.Payload"

	// oneof payload: exactly one must be set
	{text!: string & strings.MinRunes(1)} |
	{binary!: bytes}
}

#HealthCheck_HttpHealthCheck: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HealthCheck.HttpHealthCheck"
	host?:   string                       // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	path!:   string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	send?:   #HealthCheck_Payload
	receive?: [...#HealthCheck_Payload]
	response_buffer_size?: uint64 & >=0
	request_headers_to_add?: [...#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	expected_statuses?: [...v3_1.#Int64Range]
	retriable_statuses?: [...v3_1.#Int64Range]
	codec_client_type?:    v3_1.#CodecClientType
	service_name_matcher?: v3_2.#StringMatcher
	method?:               #RequestMethod
}

#HealthCheck_TcpHealthCheck: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HealthCheck.TcpHealthCheck"
	send?:   #HealthCheck_Payload
	receive?: [...#HealthCheck_Payload]
	proxy_protocol_config?: #ProxyProtocolConfig
}

#HealthCheck_RedisHealthCheck: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HealthCheck.RedisHealthCheck"
	key?:    string
}

#HealthCheck_GrpcHealthCheck: {
	"@type":       "type.googleapis.com/envoy.config.core.v3.HealthCheck.GrpcHealthCheck"
	service_name?: string
	authority?:    string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	initial_metadata?: [...#HeaderValueOption] & list.MaxItems(1000)
}

#HealthCheck_CustomHealthCheck: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HealthCheck.CustomHealthCheck"
	name!:   string & strings.MinRunes(1)

	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}}
}

#HealthCheck_TlsOptions: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HealthCheck.TlsOptions"
	alpn_protocols?: [...string]
}

#HealthStatus: "UNKNOWN" | "HEALTHY" | "UNHEALTHY" | "DRAINING" | "TIMEOUT" | "DEGRADED"
