// Code generated from envoy/type/matcher/v3/regex.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#RegexMatcher: {
	"@type":     "type.googleapis.com/envoy.type.matcher.v3.RegexMatcher"
	google_re2?: #RegexMatcher_GoogleRE2
	regex!:      string & strings.MinRunes(1)
}

#RegexMatcher_GoogleRE2: {
	"@type":           "type.googleapis.com/envoy.type.matcher.v3.RegexMatcher.GoogleRE2"
	max_program_size?: uint32
}

#RegexMatchAndSubstitute: {
	"@type":       "type.googleapis.com/envoy.type.matcher.v3.RegexMatchAndSubstitute"
	pattern!:      #RegexMatcher
	substitution?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}
