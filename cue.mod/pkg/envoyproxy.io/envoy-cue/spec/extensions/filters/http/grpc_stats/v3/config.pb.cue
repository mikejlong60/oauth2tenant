// Code generated from envoy/extensions/filters/http/grpc_stats/v3/config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FilterConfig: {
	"@type":                            "type.googleapis.com/envoy.extensions.filters.http.grpc_stats.v3.FilterConfig"
	emit_filter_state?:                 bool
	individual_method_stats_allowlist?: v3_1.#GrpcMethodList
	stats_for_all_methods?:             bool
	enable_upstream_stats?:             bool
	replace_dots_in_grpc_service_name?: bool
}

#FilterObject: {
	"@type":                 "type.googleapis.com/envoy.extensions.filters.http.grpc_stats.v3.FilterObject"
	request_message_count?:  uint64
	response_message_count?: uint64
}
