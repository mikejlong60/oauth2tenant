// Code generated from envoy/type/matcher/v3/string.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

#StringMatcher: {
	"@type":      "type.googleapis.com/envoy.type.matcher.v3.StringMatcher"
	ignore_case?: bool

	// oneof match_pattern: exactly one must be set
	{exact!: string} |
	{prefix!: string & strings.MinRunes(1)} |
	{suffix!: string & strings.MinRunes(1)} |
	{safe_regex!: #RegexMatcher} |
	{contains!: string & strings.MinRunes(1)} |
	{custom!: v3_1.#TypedExtensionConfig}
}

#ListStringMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.ListStringMatcher"
	patterns!: [...#StringMatcher] & list.MinItems(1)
}
