// Code generated from envoy/service/ratelimit/v3/rls.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/ratelimit/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#RateLimitRequest: {
	"@type": "type.googleapis.com/envoy.service.ratelimit.v3.RateLimitRequest"
	domain?: string
	descriptors?: [...v3_1.#RateLimitDescriptor]
	hits_addend?: uint32
}

#RateLimitResponse: {
	"@type":       "type.googleapis.com/envoy.service.ratelimit.v3.RateLimitResponse"
	overall_code?: #RateLimitResponse_Code
	statuses?: [...#RateLimitResponse_DescriptorStatus]
	response_headers_to_add?: [...v3_2.#HeaderValue]
	request_headers_to_add?: [...v3_2.#HeaderValue]
	raw_body?: bytes
	dynamic_metadata?: {...}
	quota?: #RateLimitResponse_Quota
}

#RateLimitResponse_RateLimit: {
	"@type":            "type.googleapis.com/envoy.service.ratelimit.v3.RateLimitResponse.RateLimit"
	name?:              string
	requests_per_unit?: uint32
	unit?:              #RateLimitResponse_RateLimit_Unit
}

#RateLimitResponse_RateLimit_Unit: "UNKNOWN" | "SECOND" | "MINUTE" | "HOUR" | "DAY" | "WEEK" | "MONTH" | "YEAR"

#RateLimitResponse_Quota: {
	"@type":      "type.googleapis.com/envoy.service.ratelimit.v3.RateLimitResponse.Quota"
	requests?:    uint32 & >0
	valid_until?: string
	id?:          string
}

#RateLimitResponse_DescriptorStatus: {
	"@type":               "type.googleapis.com/envoy.service.ratelimit.v3.RateLimitResponse.DescriptorStatus"
	code?:                 #RateLimitResponse_Code
	current_limit?:        #RateLimitResponse_RateLimit
	limit_remaining?:      uint32
	duration_until_reset?: string
	quota?:                #RateLimitResponse_Quota
}

#RateLimitResponse_Code: "UNKNOWN" | "OK" | "OVER_LIMIT"
