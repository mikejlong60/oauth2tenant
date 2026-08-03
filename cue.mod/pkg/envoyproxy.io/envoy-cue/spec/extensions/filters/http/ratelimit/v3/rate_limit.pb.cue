// Code generated from envoy/extensions/filters/http/ratelimit/v3/rate_limit.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/ratelimit/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#RateLimit: {
	"@type":                             "type.googleapis.com/envoy.extensions.filters.http.ratelimit.v3.RateLimit"
	domain!:                             string & strings.MinRunes(1)
	stage?:                              uint32 & <=10
	request_type!:                       string & ("internal" | "external" | "both" | "")
	timeout?:                            string
	failure_mode_deny?:                  bool
	rate_limited_as_resource_exhausted?: bool
	rate_limit_service!:                 v3_1.#RateLimitServiceConfig
	enable_x_ratelimit_headers?:         #RateLimit_XRateLimitHeadersRFCVersion
	disable_x_envoy_ratelimited_header?: bool
	rate_limited_status?:                v3_2.#HttpStatus
	response_headers_to_add?: [...v3_3.#HeaderValueOption] & list.MaxItems(10)
	status_on_error?:           v3_2.#HttpStatus
	stat_prefix?:               string
	filter_enabled?:            v3_3.#RuntimeFractionalPercent
	filter_enforced?:           v3_3.#RuntimeFractionalPercent
	failure_mode_deny_percent?: v3_3.#RuntimeFractionalPercent
	rate_limits?: [...v3_4.#RateLimit]
}

#RateLimit_XRateLimitHeadersRFCVersion: "OFF" | "DRAFT_VERSION_03"

#RateLimitPerRoute: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.ratelimit.v3.RateLimitPerRoute"
	vh_rate_limits?:  #RateLimitPerRoute_VhRateLimitsOptions
	override_option?: #RateLimitPerRoute_OverrideOptions
	rate_limits?: [...v3_4.#RateLimit]
	domain?: string
}

#RateLimitPerRoute_VhRateLimitsOptions: "OVERRIDE" | "INCLUDE" | "IGNORE"

#RateLimitPerRoute_OverrideOptions: "DEFAULT" | "OVERRIDE_POLICY" | "INCLUDE_POLICY" | "IGNORE_POLICY"
