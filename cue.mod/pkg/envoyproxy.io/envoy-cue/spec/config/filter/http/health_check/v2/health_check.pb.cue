// Code generated from envoy/config/filter/http/health_check/v2/health_check.proto. DO NOT EDIT.
package v2

import (
	route_2 "envoyproxy.io/envoy-cue/spec/api/v2/route"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#HealthCheck: {
	"@type":            "type.googleapis.com/envoy.config.filter.http.health_check.v2.HealthCheck"
	pass_through_mode!: bool
	cache_time?:        string
	cluster_min_healthy_percentages?: {[string]: type_1.#Percent}
	headers?: [...route_2.#HeaderMatcher]
}
