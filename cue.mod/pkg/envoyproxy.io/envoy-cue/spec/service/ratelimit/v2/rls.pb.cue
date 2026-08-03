// Code generated from envoy/service/ratelimit/v2/rls.proto. DO NOT EDIT.
package v2

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	ratelimit_1 "envoyproxy.io/envoy-cue/spec/api/v2/ratelimit"
)

#RateLimitRequest: {
	"@type": "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitRequest"
	domain?: string
	descriptors?: [...ratelimit_1.#RateLimitDescriptor]
	hits_addend?: uint32
}

#RateLimitResponse: {
	"@type":       "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitResponse"
	overall_code?: #RateLimitResponse_Code
	statuses?: [...#RateLimitResponse_DescriptorStatus]
	headers?: [...core_2.#HeaderValue]
	request_headers_to_add?: [...core_2.#HeaderValue]
}

#RateLimitResponse_RateLimit: {
	"@type":            "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitResponse.RateLimit"
	name?:              string
	requests_per_unit?: uint32
	unit?:              #RateLimitResponse_RateLimit_Unit
}

#RateLimitResponse_RateLimit_Unit: "UNKNOWN" | "SECOND" | "MINUTE" | "HOUR" | "DAY"

#RateLimitResponse_DescriptorStatus: {
	"@type":          "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitResponse.DescriptorStatus"
	code?:            #RateLimitResponse_Code
	current_limit?:   #RateLimitResponse_RateLimit
	limit_remaining?: uint32
}

#RateLimitResponse_Code: "UNKNOWN" | "OK" | "OVER_LIMIT"
