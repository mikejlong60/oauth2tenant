// Code generated from envoy/config/filter/network/rate_limit/v2/rate_limit.proto. DO NOT EDIT.
package v2

import (
	"list"
	ratelimit_1 "envoyproxy.io/envoy-cue/spec/api/v2/ratelimit"
	v2_2 "envoyproxy.io/envoy-cue/spec/config/ratelimit/v2"
)

#RateLimit: {
	"@type":      "type.googleapis.com/envoy.config.filter.network.rate_limit.v2.RateLimit"
	stat_prefix!: string & !=""
	domain!:      string & !=""
	descriptors!: [...ratelimit_1.#RateLimitDescriptor] & list.MinItems(1)
	timeout?:            string
	failure_mode_deny?:  bool
	rate_limit_service!: v2_2.#RateLimitServiceConfig
}
