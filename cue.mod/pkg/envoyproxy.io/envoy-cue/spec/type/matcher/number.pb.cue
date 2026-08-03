// Code generated from envoy/type/matcher/number.proto. DO NOT EDIT.
package matcher

import (
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#DoubleMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.DoubleMatcher"
	range?:  type_1.#DoubleRange
	exact?:  float64
}
