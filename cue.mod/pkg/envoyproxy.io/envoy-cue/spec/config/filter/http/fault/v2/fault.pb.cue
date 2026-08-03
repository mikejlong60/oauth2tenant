// Code generated from envoy/config/filter/http/fault/v2/fault.proto. DO NOT EDIT.
package v2

import (
	route_3 "envoyproxy.io/envoy-cue/spec/api/v2/route"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
	v2_2 "envoyproxy.io/envoy-cue/spec/config/filter/fault/v2"
)

#FaultAbort: {
	"@type":       "type.googleapis.com/envoy.config.filter.http.fault.v2.FaultAbort"
	http_status?:  uint32 & >=200 & <600
	header_abort?: #FaultAbort_HeaderAbort
	percentage?:   type_1.#FractionalPercent
}

#FaultAbort_HeaderAbort: {
	"@type": "type.googleapis.com/envoy.config.filter.http.fault.v2.FaultAbort.HeaderAbort"
}

#HTTPFault: {
	"@type":           "type.googleapis.com/envoy.config.filter.http.fault.v2.HTTPFault"
	delay?:            v2_2.#FaultDelay
	abort?:            #FaultAbort
	upstream_cluster?: string
	headers?: [...route_3.#HeaderMatcher]
	downstream_nodes?: [...string]
	max_active_faults?:                   uint32
	response_rate_limit?:                 v2_2.#FaultRateLimit
	delay_percent_runtime?:               string
	abort_percent_runtime?:               string
	delay_duration_runtime?:              string
	abort_http_status_runtime?:           string
	max_active_faults_runtime?:           string
	response_rate_limit_percent_runtime?: string
}
