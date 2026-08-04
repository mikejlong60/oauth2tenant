// Code generated from envoy/type/matcher/string.proto. DO NOT EDIT.
package matcher

import (
	"list"
	"strings"
)

#StringMatcher: {
	"@type":      "type.googleapis.com/envoy.type.matcher.StringMatcher"
	ignore_case?: bool

	// oneof match_pattern: exactly one must be set
	{exact!: string} |
	{prefix!: string & strings.MinRunes(1)} |
	{suffix!: string & strings.MinRunes(1)} |
	{regex!: string} |
	{safe_regex!: #RegexMatcher}
}

#ListStringMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.ListStringMatcher"
	patterns!: [...#StringMatcher] & list.MinItems(1)
}
