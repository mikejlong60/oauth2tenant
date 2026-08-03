// Code generated from envoy/config/filter/http/rate_limit/v2/rate_limit.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/ratelimit/v2"
)

#RateLimit: {
	"@type":                             "type.googleapis.com/envoy.config.filter.http.rate_limit.v2.RateLimit"
	domain!:                             string & !=""
	stage?:                              uint32 & <=10
	request_type!:                       string & ("internal" | "external" | "both" | "")
	timeout?:                            string
	failure_mode_deny?:                  bool
	rate_limited_as_resource_exhausted?: bool
	rate_limit_service!:                 v2_1.#RateLimitServiceConfig
}
