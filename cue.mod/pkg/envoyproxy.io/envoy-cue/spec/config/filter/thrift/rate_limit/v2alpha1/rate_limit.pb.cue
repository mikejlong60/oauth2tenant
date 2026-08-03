// Code generated from envoy/config/filter/thrift/rate_limit/v2alpha1/rate_limit.proto. DO NOT EDIT.
package v2alpha1

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/ratelimit/v2"
)

#RateLimit: {
	"@type":             "type.googleapis.com/envoy.config.filter.thrift.rate_limit.v2alpha1.RateLimit"
	domain!:             string & !=""
	stage?:              uint32 & <=10
	timeout?:            string
	failure_mode_deny?:  bool
	rate_limit_service!: v2_1.#RateLimitServiceConfig
}
