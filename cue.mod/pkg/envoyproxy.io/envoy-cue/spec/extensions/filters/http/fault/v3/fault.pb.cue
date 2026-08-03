// Code generated from envoy/extensions/filters/http/fault/v3/fault.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/filters/common/fault/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#FaultAbort: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.http.fault.v3.FaultAbort"
	http_status?:  uint32 & >=200 & <600
	grpc_status?:  uint32
	header_abort?: #FaultAbort_HeaderAbort
	percentage?:   v3_1.#FractionalPercent
}

#FaultAbort_HeaderAbort: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.fault.v3.FaultAbort.HeaderAbort"
}

#HTTPFault: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.http.fault.v3.HTTPFault"
	delay?:            v3_2.#FaultDelay
	abort?:            #FaultAbort
	upstream_cluster?: string
	headers?: [...v3_3.#HeaderMatcher]
	downstream_nodes?: [...string]
	max_active_faults?:                   uint32
	response_rate_limit?:                 v3_2.#FaultRateLimit
	delay_percent_runtime?:               string
	abort_percent_runtime?:               string
	delay_duration_runtime?:              string
	abort_http_status_runtime?:           string
	max_active_faults_runtime?:           string
	response_rate_limit_percent_runtime?: string
	abort_grpc_status_runtime?:           string
	disable_downstream_cluster_stats?:    bool
	filter_metadata?: {...}
}
