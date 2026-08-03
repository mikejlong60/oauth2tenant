// Code generated from envoy/config/trace/v3/zipkin.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ZipkinConfig: {
	"@type":                     "type.googleapis.com/envoy.config.trace.v3.ZipkinConfig"
	collector_cluster?:          string
	collector_endpoint?:         string
	trace_id_128bit?:            bool
	shared_span_context?:        bool
	collector_endpoint_version?: #ZipkinConfig_CollectorEndpointVersion
	collector_hostname?:         string
	split_spans_for_request?:    bool
	trace_context_option?:       #ZipkinConfig_TraceContextOption
	collector_service?:          v3_1.#HttpService
}

#ZipkinConfig_TraceContextOption: "USE_B3" | "USE_B3_WITH_W3C_PROPAGATION"

#ZipkinConfig_CollectorEndpointVersion: "DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE" | "HTTP_JSON" | "HTTP_PROTO" | "GRPC"
