// Code generated from envoy/config/accesslog/v3/accesslog.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_5 "envoyproxy.io/envoy-cue/spec/data/accesslog/v3"
)

#AccessLog: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.AccessLog"
	name?:   string
	filter?: #AccessLogFilter
	typed_config?: {...}
}

#AccessLogFilter: {
	"@type":                  "type.googleapis.com/envoy.config.accesslog.v3.AccessLogFilter"
	status_code_filter?:      #StatusCodeFilter
	duration_filter?:         #DurationFilter
	not_health_check_filter?: #NotHealthCheckFilter
	traceable_filter?:        #TraceableFilter
	runtime_filter?:          #RuntimeFilter
	and_filter?:              #AndFilter
	or_filter?:               #OrFilter
	header_filter?:           #HeaderFilter
	response_flag_filter?:    #ResponseFlagFilter
	grpc_status_filter?:      #GrpcStatusFilter
	extension_filter?:        #ExtensionFilter
	metadata_filter?:         #MetadataFilter
	log_type_filter?:         #LogTypeFilter
}

#ComparisonFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.ComparisonFilter"
	op?:     #ComparisonFilter_Op
	value!:  v3_1.#RuntimeUInt32
}

#ComparisonFilter_Op: "EQ" | "GE" | "LE" | "NE"

#StatusCodeFilter: {
	"@type":     "type.googleapis.com/envoy.config.accesslog.v3.StatusCodeFilter"
	comparison!: #ComparisonFilter
}

#DurationFilter: {
	"@type":     "type.googleapis.com/envoy.config.accesslog.v3.DurationFilter"
	comparison!: #ComparisonFilter
}

#NotHealthCheckFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.NotHealthCheckFilter"
}

#TraceableFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.TraceableFilter"
}

#RuntimeFilter: {
	"@type":                     "type.googleapis.com/envoy.config.accesslog.v3.RuntimeFilter"
	runtime_key!:                string & strings.MinRunes(1)
	percent_sampled?:            v3_2.#FractionalPercent
	use_independent_randomness?: bool
}

#AndFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.AndFilter"
	filters!: [...#AccessLogFilter] & list.MinItems(2)
}

#OrFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.OrFilter"
	filters!: [...#AccessLogFilter] & list.MinItems(2)
}

#HeaderFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.HeaderFilter"
	header!: v3_3.#HeaderMatcher
}

#ResponseFlagFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.ResponseFlagFilter"
	flags?: [...string]
}

#GrpcStatusFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.GrpcStatusFilter"
	statuses?: [...#GrpcStatusFilter_Status]
	exclude?: bool
}

#GrpcStatusFilter_Status: "OK" | "CANCELED" | "UNKNOWN" | "INVALID_ARGUMENT" | "DEADLINE_EXCEEDED" | "NOT_FOUND" | "ALREADY_EXISTS" | "PERMISSION_DENIED" | "RESOURCE_EXHAUSTED" | "FAILED_PRECONDITION" | "ABORTED" | "OUT_OF_RANGE" | "UNIMPLEMENTED" | "INTERNAL" | "UNAVAILABLE" | "DATA_LOSS" | "UNAUTHENTICATED"

#MetadataFilter: {
	"@type":                 "type.googleapis.com/envoy.config.accesslog.v3.MetadataFilter"
	matcher?:                v3_4.#MetadataMatcher
	match_if_key_not_found?: bool
}

#LogTypeFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.LogTypeFilter"
	types?: [...v3_5.#AccessLogType]
	exclude?: bool
}

#ExtensionFilter: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v3.ExtensionFilter"
	name?:   string
	typed_config?: {...}
}
