// Code generated from envoy/extensions/matching/input_matchers/runtime_fraction/v3/runtime_fraction.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#RuntimeFraction: {
	"@type":           "type.googleapis.com/envoy.extensions.matching.input_matchers.runtime_fraction.v3.RuntimeFraction"
	runtime_fraction!: v3_1.#RuntimeFractionalPercent
	seed?:             uint64
}
