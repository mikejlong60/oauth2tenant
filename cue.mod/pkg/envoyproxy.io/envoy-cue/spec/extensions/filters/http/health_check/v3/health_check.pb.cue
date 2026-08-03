// Code generated from envoy/extensions/filters/http/health_check/v3/health_check.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#HealthCheck: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.http.health_check.v3.HealthCheck"
	pass_through_mode!: bool
	cache_time?:        string
	cluster_min_healthy_percentages?: {[string]: v3_1.#Percent}
	headers?: [...v3_2.#HeaderMatcher]
}
