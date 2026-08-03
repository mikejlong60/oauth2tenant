// Code generated from envoy/extensions/filters/network/thrift_proxy/filters/ratelimit/v3/rate_limit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/ratelimit/v3"
)

#RateLimit: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.ratelimit.v3.RateLimit"
	domain!:             string & strings.MinRunes(1)
	stage?:              uint32 & <=10
	timeout?:            string
	failure_mode_deny?:  bool
	rate_limit_service!: v3_1.#RateLimitServiceConfig
}
