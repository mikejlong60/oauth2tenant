// Code generated from xds/type/matcher/v3/regex.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#RegexMatcher: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.RegexMatcher"
	regex!:  string & strings.MinRunes(1)

	// oneof engine_type: exactly one must be set
	{google_re2!: #RegexMatcher_GoogleRE2}
}

#RegexMatcher_GoogleRE2: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.RegexMatcher.GoogleRE2"
}
