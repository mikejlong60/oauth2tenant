// Code generated from envoy/config/filter/network/local_rate_limit/v2alpha/local_rate_limit.proto. DO NOT EDIT.
package v2alpha

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#LocalRateLimit: {
	"@type":          "type.googleapis.com/envoy.config.filter.network.local_rate_limit.v2alpha.LocalRateLimit"
	stat_prefix!:     string & !=""
	token_bucket!:    type_1.#TokenBucket
	runtime_enabled?: core_2.#RuntimeFeatureFlag
}
