// Code generated from envoy/config/filter/http/csrf/v2/csrf.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_2 "envoyproxy.io/envoy-cue/spec/type/matcher"
)

#CsrfPolicy: {
	"@type":         "type.googleapis.com/envoy.config.filter.http.csrf.v2.CsrfPolicy"
	filter_enabled!: core_1.#RuntimeFractionalPercent
	shadow_enabled?: core_1.#RuntimeFractionalPercent
	additional_origins?: [...matcher_2.#StringMatcher]
}
