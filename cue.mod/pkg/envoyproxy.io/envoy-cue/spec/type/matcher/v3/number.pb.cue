// Code generated from envoy/type/matcher/v3/number.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#DoubleMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.DoubleMatcher"
	range?:  v3_1.#DoubleRange
	exact?:  float64
}
