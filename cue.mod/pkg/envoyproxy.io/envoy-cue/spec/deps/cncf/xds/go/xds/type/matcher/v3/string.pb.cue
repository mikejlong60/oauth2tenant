// Code generated from xds/type/matcher/v3/string.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

#StringMatcher: {
	"@type":      "type.googleapis.com/xds.type.matcher.v3.StringMatcher"
	exact?:       string
	prefix!:      string & strings.MinRunes(1)
	suffix!:      string & strings.MinRunes(1)
	safe_regex!:  #RegexMatcher
	contains!:    string & strings.MinRunes(1)
	custom?:      v3_1.#TypedExtensionConfig
	ignore_case?: bool
}

#ListStringMatcher: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.ListStringMatcher"
	patterns!: [...#StringMatcher] & list.MinItems(1)
}
