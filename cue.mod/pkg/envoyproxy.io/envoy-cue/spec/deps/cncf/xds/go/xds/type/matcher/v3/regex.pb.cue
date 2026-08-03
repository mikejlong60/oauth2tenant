// Code generated from xds/type/matcher/v3/regex.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#RegexMatcher: {
	"@type":     "type.googleapis.com/xds.type.matcher.v3.RegexMatcher"
	google_re2!: #RegexMatcher_GoogleRE2
	regex!:      string & strings.MinRunes(1)
}

#RegexMatcher_GoogleRE2: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.RegexMatcher.GoogleRE2"
}
