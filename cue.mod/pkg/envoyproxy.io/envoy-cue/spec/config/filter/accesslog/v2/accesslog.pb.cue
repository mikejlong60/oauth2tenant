// Code generated from envoy/config/filter/accesslog/v2/accesslog.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	route_3 "envoyproxy.io/envoy-cue/spec/api/v2/route"
	type_2 "envoyproxy.io/envoy-cue/spec/type"
)

#AccessLog: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.AccessLog"
	name?:   string
	filter?: #AccessLogFilter

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#AccessLogFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.AccessLogFilter"

	// oneof filter_specifier: exactly one must be set
	{status_code_filter!: #StatusCodeFilter} |
	{duration_filter!: #DurationFilter} |
	{not_health_check_filter!: #NotHealthCheckFilter} |
	{traceable_filter!: #TraceableFilter} |
	{runtime_filter!: #RuntimeFilter} |
	{and_filter!: #AndFilter} |
	{or_filter!: #OrFilter} |
	{header_filter!: #HeaderFilter} |
	{response_flag_filter!: #ResponseFlagFilter} |
	{grpc_status_filter!: #GrpcStatusFilter} |
	{extension_filter!: #ExtensionFilter}
}

#ComparisonFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.ComparisonFilter"
	op?:     #ComparisonFilter_Op
	value?:  core_1.#RuntimeUInt32
}

#ComparisonFilter_Op: "EQ" | "GE" | "LE"

#StatusCodeFilter: {
	"@type":     "type.googleapis.com/envoy.config.filter.accesslog.v2.StatusCodeFilter"
	comparison!: #ComparisonFilter
}

#DurationFilter: {
	"@type":     "type.googleapis.com/envoy.config.filter.accesslog.v2.DurationFilter"
	comparison!: #ComparisonFilter
}

#NotHealthCheckFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.NotHealthCheckFilter"
}

#TraceableFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.TraceableFilter"
}

#RuntimeFilter: {
	"@type":                     "type.googleapis.com/envoy.config.filter.accesslog.v2.RuntimeFilter"
	runtime_key!:                string & !=""
	percent_sampled?:            type_2.#FractionalPercent
	use_independent_randomness?: bool
}

#AndFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.AndFilter"
	filters!: [...#AccessLogFilter] & list.MinItems(2)
}

#OrFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.OrFilter"
	filters!: [...#AccessLogFilter] & list.MinItems(2)
}

#HeaderFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.HeaderFilter"
	header!: route_3.#HeaderMatcher
}

#ResponseFlagFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.ResponseFlagFilter"
	flags?: [...string]
}

#GrpcStatusFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.GrpcStatusFilter"
	statuses?: [...#GrpcStatusFilter_Status]
	exclude?: bool
}

#GrpcStatusFilter_Status: "OK" | "CANCELED" | "UNKNOWN" | "INVALID_ARGUMENT" | "DEADLINE_EXCEEDED" | "NOT_FOUND" | "ALREADY_EXISTS" | "PERMISSION_DENIED" | "RESOURCE_EXHAUSTED" | "FAILED_PRECONDITION" | "ABORTED" | "OUT_OF_RANGE" | "UNIMPLEMENTED" | "INTERNAL" | "UNAVAILABLE" | "DATA_LOSS" | "UNAUTHENTICATED"

#ExtensionFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.accesslog.v2.ExtensionFilter"
	name?:   string

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}
