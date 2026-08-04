// Code generated from envoy/type/matcher/v3/filter_state.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// FilterStateMatcher provides a general interface for matching the filter state objects.
#FilterStateMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.FilterStateMatcher"

	// The filter state key to retrieve the object.
	key!: string & strings.MinRunes(1)

	// oneof matcher: exactly one must be set
	// Matches the filter state object as a string value.
	{string_match!: #StringMatcher} |
	{

		// Matches the filter state object as a ip Instance.
		address_match!: #AddressMatcher
	}
}
