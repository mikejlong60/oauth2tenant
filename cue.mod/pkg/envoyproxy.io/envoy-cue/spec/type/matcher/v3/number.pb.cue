// Code generated from envoy/type/matcher/v3/number.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

// Specifies the way to match a double value.
#DoubleMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.DoubleMatcher"

	// oneof match_pattern: exactly one must be set
	// If specified, the input double value must be in the range specified here.
	// Note: The range is using half-open interval semantics [start, end).
	{range!: v3_1.#DoubleRange} |
	{

		// If specified, the input double value must be equal to the value specified here.
		exact!: float64
	}
}
