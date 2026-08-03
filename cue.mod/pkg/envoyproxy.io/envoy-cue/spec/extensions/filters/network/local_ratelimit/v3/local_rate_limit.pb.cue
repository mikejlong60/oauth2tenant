// Code generated from envoy/extensions/filters/network/local_ratelimit/v3/local_rate_limit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#LocalRateLimit: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.network.local_ratelimit.v3.LocalRateLimit"
	stat_prefix!:     string & strings.MinRunes(1)
	token_bucket!:    v3_1.#TokenBucket
	runtime_enabled?: v3_2.#RuntimeFeatureFlag
	share_key?:       string
}
