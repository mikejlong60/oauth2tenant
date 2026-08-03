// Code generated from envoy/extensions/filters/network/ratelimit/v3/rate_limit.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/ratelimit/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/ratelimit/v3"
)

#RateLimit: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.network.ratelimit.v3.RateLimit"
	stat_prefix!: string & strings.MinRunes(1)
	domain!:      string & strings.MinRunes(1)
	descriptors!: [...v3_1.#RateLimitDescriptor] & list.MinItems(1)
	timeout?:            string
	failure_mode_deny?:  bool
	rate_limit_service!: v3_2.#RateLimitServiceConfig
}
