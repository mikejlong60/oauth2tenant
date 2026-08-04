// Code generated from envoy/config/filter/http/grpc_stats/v2alpha/config.proto. DO NOT EDIT.
package v2alpha

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#FilterConfig: {
	"@type":            "type.googleapis.com/envoy.config.filter.http.grpc_stats.v2alpha.FilterConfig"
	emit_filter_state?: bool

	// oneof per_method_stat_specifier: at most one may be set
	*{} |
	{individual_method_stats_allowlist!: core_1.#GrpcMethodList} |
	{stats_for_all_methods!: bool}
}

#FilterObject: {
	"@type":                 "type.googleapis.com/envoy.config.filter.http.grpc_stats.v2alpha.FilterObject"
	request_message_count?:  uint64
	response_message_count?: uint64
}
