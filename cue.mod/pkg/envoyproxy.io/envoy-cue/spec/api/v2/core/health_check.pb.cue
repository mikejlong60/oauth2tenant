// Code generated from envoy/api/v2/core/health_check.proto. DO NOT EDIT.
package core

import (
	"list"
	matcher_2 "envoyproxy.io/envoy-cue/spec/type/matcher"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#HealthCheck: {
	"@type":                           "type.googleapis.com/envoy.api.v2.core.HealthCheck"
	timeout!:                          string // TODO(pgv): duration bounds
	interval!:                         string // TODO(pgv): duration bounds
	initial_jitter?:                   string
	interval_jitter?:                  string
	interval_jitter_percent?:          uint32
	unhealthy_threshold!:              uint32
	healthy_threshold!:                uint32
	alt_port?:                         uint32
	reuse_connection?:                 bool
	no_traffic_interval?:              string // TODO(pgv): duration bounds
	unhealthy_interval?:               string // TODO(pgv): duration bounds
	unhealthy_edge_interval?:          string // TODO(pgv): duration bounds
	healthy_edge_interval?:            string // TODO(pgv): duration bounds
	event_log_path?:                   string
	event_service?:                    #EventServiceConfig
	always_log_health_check_failures?: bool
	tls_options?:                      #HealthCheck_TlsOptions

	// oneof health_checker: exactly one must be set
	{http_health_check!: #HealthCheck_HttpHealthCheck} |
	{tcp_health_check!: #HealthCheck_TcpHealthCheck} |
	{grpc_health_check!: #HealthCheck_GrpcHealthCheck} |
	{custom_health_check!: #HealthCheck_CustomHealthCheck}
}

#HealthCheck_Payload: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HealthCheck.Payload"

	// oneof payload: exactly one must be set
	{text!: string & !=""} |
	{binary!: bytes}
}

#HealthCheck_HttpHealthCheck: {
	"@type":       "type.googleapis.com/envoy.api.v2.core.HealthCheck.HttpHealthCheck"
	host?:         string
	path!:         string & !=""
	send?:         #HealthCheck_Payload
	receive?:      #HealthCheck_Payload
	service_name?: string
	request_headers_to_add?: [...#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	use_http2?: bool
	expected_statuses?: [...type_1.#Int64Range]
	codec_client_type?:    type_1.#CodecClientType
	service_name_matcher?: matcher_2.#StringMatcher
}

#HealthCheck_TcpHealthCheck: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HealthCheck.TcpHealthCheck"
	send?:   #HealthCheck_Payload
	receive?: [...#HealthCheck_Payload]
}

#HealthCheck_RedisHealthCheck: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HealthCheck.RedisHealthCheck"
	key?:    string
}

#HealthCheck_GrpcHealthCheck: {
	"@type":       "type.googleapis.com/envoy.api.v2.core.HealthCheck.GrpcHealthCheck"
	service_name?: string
	authority?:    string
}

#HealthCheck_CustomHealthCheck: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HealthCheck.CustomHealthCheck"
	name!:   string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#HealthCheck_TlsOptions: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HealthCheck.TlsOptions"
	alpn_protocols?: [...string]
}

#HealthStatus: "UNKNOWN" | "HEALTHY" | "UNHEALTHY" | "DRAINING" | "TIMEOUT" | "DEGRADED"
