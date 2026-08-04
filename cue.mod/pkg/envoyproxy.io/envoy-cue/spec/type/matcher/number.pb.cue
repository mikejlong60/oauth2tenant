// Code generated from envoy/type/matcher/number.proto. DO NOT EDIT.
package matcher

import (
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

// Specifies the way to match a double value.
#DoubleMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.DoubleMatcher"

	// oneof match_pattern: exactly one must be set
	// If specified, the input double value must be in the range specified here.
	// Note: The range is using half-open interval semantics [start, end).
	{range!: type_1.#DoubleRange} |
	{

		// If specified, the input double value must be equal to the value specified here.
		exact!: float64
	}
}
