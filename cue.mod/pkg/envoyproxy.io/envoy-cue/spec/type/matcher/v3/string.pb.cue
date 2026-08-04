// Code generated from envoy/type/matcher/v3/string.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

// Specifies the way to match a string.
// [#next-free-field: 9]
#StringMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.StringMatcher"

	// If ``true``, indicates the exact/prefix/suffix/contains matching should be case insensitive. This
	// has no effect for the ``safe_regex`` match.
	// For example, the matcher ``data`` will match both input string ``Data`` and ``data`` if this option
	// is set to ``true``.
	ignore_case?: bool

	// oneof match_pattern: exactly one must be set
	// The input string must match exactly the string specified here.
	//
	// Examples:
	//
	// * ``abc`` only matches the value ``abc``.
	{exact!: string} |
	{

		// The input string must have the prefix specified here.
		//
		// .. note::
		//
		//  Empty prefix match is not allowed, please use ``safe_regex`` instead.
		//
		// Examples:
		//
		// * ``abc`` matches the value ``abc.xyz``
		prefix!: string & strings.MinRunes(1)
	} |
	{

		// The input string must have the suffix specified here.
		//
		// .. note::
		//
		//  Empty suffix match is not allowed, please use ``safe_regex`` instead.
		//
		// Examples:
		//
		// * ``abc`` matches the value ``xyz.abc``
		suffix!: string & strings.MinRunes(1)
	} |
	{

		// The input string must match the regular expression specified here.
		safe_regex!: #RegexMatcher
	} |
	{

		// The input string must have the substring specified here.
		//
		// .. note::
		//
		//  Empty contains match is not allowed, please use ``safe_regex`` instead.
		//
		// Examples:
		//
		// * ``abc`` matches the value ``xyz.abc.def``
		contains!: string & strings.MinRunes(1)
	} |
	{

		// Use an extension as the matcher type.
		// [#extension-category: envoy.string_matcher]
		custom!: v3_1.#TypedExtensionConfig
	}
}

// Specifies a list of ways to match a string.
#ListStringMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.ListStringMatcher"
	patterns!: [...#StringMatcher] & list.MinItems(1)
}
