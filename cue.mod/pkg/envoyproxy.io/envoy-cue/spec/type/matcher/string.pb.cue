// Code generated from envoy/type/matcher/string.proto. DO NOT EDIT.
package matcher

import (
	"list"
	"strings"
)

#StringMatcher: {
	"@type":      "type.googleapis.com/envoy.type.matcher.StringMatcher"
	exact?:       string
	prefix!:      string & strings.MinRunes(1)
	suffix!:      string & strings.MinRunes(1)
	regex?:       string
	safe_regex!:  #RegexMatcher
	ignore_case?: bool
}

#ListStringMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.ListStringMatcher"
	patterns!: [...#StringMatcher] & list.MinItems(1)
}
