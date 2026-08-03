// Code generated from envoy/type/matcher/regex.proto. DO NOT EDIT.
package matcher

import (
	"strings"
)

#RegexMatcher: {
	"@type":     "type.googleapis.com/envoy.type.matcher.RegexMatcher"
	google_re2!: #RegexMatcher_GoogleRE2
	regex!:      string & strings.MinRunes(1)
}

#RegexMatcher_GoogleRE2: {
	"@type":           "type.googleapis.com/envoy.type.matcher.RegexMatcher.GoogleRE2"
	max_program_size?: uint32
}

#RegexMatchAndSubstitute: {
	"@type":       "type.googleapis.com/envoy.type.matcher.RegexMatchAndSubstitute"
	pattern?:      #RegexMatcher
	substitution?: string
}
