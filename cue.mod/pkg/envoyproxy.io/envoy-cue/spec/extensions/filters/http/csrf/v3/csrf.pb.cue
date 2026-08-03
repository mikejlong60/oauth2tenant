// Code generated from envoy/extensions/filters/http/csrf/v3/csrf.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#CsrfPolicy: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.csrf.v3.CsrfPolicy"
	filter_enabled!: v3_1.#RuntimeFractionalPercent
	shadow_enabled?: v3_1.#RuntimeFractionalPercent
	additional_origins?: [...v3_2.#StringMatcher]
}
