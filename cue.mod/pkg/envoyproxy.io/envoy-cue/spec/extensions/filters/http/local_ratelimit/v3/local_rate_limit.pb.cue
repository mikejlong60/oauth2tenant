// Code generated from envoy/extensions/filters/http/local_ratelimit/v3/local_rate_limit.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/extensions/common/ratelimit/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#LocalRateLimit: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.local_ratelimit.v3.LocalRateLimit"
	stat_prefix!:     string & strings.MinRunes(1)
	status?:          v3_1.#HttpStatus
	token_bucket?:    v3_1.#TokenBucket
	filter_enabled?:  v3_2.#RuntimeFractionalPercent
	filter_enforced?: v3_2.#RuntimeFractionalPercent
	request_headers_to_add_when_not_enforced?: [...v3_2.#HeaderValueOption] & list.MaxItems(10)
	response_headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(10)
	descriptors?: [...v3_3.#LocalRateLimitDescriptor]
	stage?:                                      uint32 & <=10
	local_rate_limit_per_downstream_connection?: bool
	local_cluster_rate_limit?:                   v3_3.#LocalClusterRateLimit
	enable_x_ratelimit_headers?:                 v3_3.#XRateLimitHeadersRFCVersion
	vh_rate_limits?:                             v3_3.#VhRateLimitsOptions
	always_consume_default_token_bucket?:        bool
	rate_limited_as_resource_exhausted?:         bool
	rate_limits?: [...v3_4.#RateLimit]
	max_dynamic_descriptors?: uint32 & >=1
}
