// Code generated from envoy/type/matcher/v3/filter_state.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#FilterStateMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.FilterStateMatcher"
	key!:    string & strings.MinRunes(1)

	// oneof matcher: exactly one must be set
	{string_match!: #StringMatcher} |
	{address_match!: #AddressMatcher}
}
