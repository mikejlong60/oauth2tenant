// Code generated from envoy/type/matcher/v3/value.proto. DO NOT EDIT.
package v3

import (
	"list"
)

#ValueMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.ValueMatcher"

	// oneof match_pattern: exactly one must be set
	{null_match!: #ValueMatcher_NullMatch} |
	{double_match!: #DoubleMatcher} |
	{string_match!: #StringMatcher} |
	{bool_match!: bool} |
	{present_match!: bool} |
	{list_match!: #ListMatcher} |
	{or_match!: #OrMatcher}
}

#ValueMatcher_NullMatch: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.ValueMatcher.NullMatch"
}

#ListMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.ListMatcher"

	// oneof match_pattern: exactly one must be set
	{one_of!: #ValueMatcher}
}

#OrMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.OrMatcher"
	value_matchers!: [...#ValueMatcher] & list.MinItems(2)
}
