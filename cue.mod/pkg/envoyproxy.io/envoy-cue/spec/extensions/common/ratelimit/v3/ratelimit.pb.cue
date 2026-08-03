// Code generated from envoy/extensions/common/ratelimit/v3/ratelimit.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#RateLimitDescriptor: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.RateLimitDescriptor"
	entries!: [...#RateLimitDescriptor_Entry] & list.MinItems(1)
	limit?:       #RateLimitDescriptor_RateLimitOverride
	hits_addend?: uint64
}

#RateLimitDescriptor_Entry: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.RateLimitDescriptor.Entry"
	key!:    string & strings.MinRunes(1)
	value?:  string
}

#RateLimitDescriptor_RateLimitOverride: {
	"@type":            "type.googleapis.com/envoy.extensions.common.ratelimit.v3.RateLimitDescriptor.RateLimitOverride"
	requests_per_unit?: uint32
	unit?:              v3_1.#RateLimitUnit
}

#LocalRateLimitDescriptor: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.LocalRateLimitDescriptor"
	entries!: [...#RateLimitDescriptor_Entry] & list.MinItems(1)
	token_bucket!: v3_1.#TokenBucket
	shadow_mode?:  bool
}

#LocalClusterRateLimit: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.LocalClusterRateLimit"
}

#XRateLimitHeadersRFCVersion: "OFF" | "DRAFT_VERSION_03"

#VhRateLimitsOptions: "OVERRIDE" | "INCLUDE" | "IGNORE"
