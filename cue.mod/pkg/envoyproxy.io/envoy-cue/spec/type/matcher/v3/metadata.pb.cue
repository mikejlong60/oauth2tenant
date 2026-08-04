// Code generated from envoy/type/matcher/v3/metadata.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#MetadataMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.MetadataMatcher"
	filter!: string & strings.MinRunes(1)
	path!: [...#MetadataMatcher_PathSegment] & list.MinItems(1)
	value!:  #ValueMatcher
	invert?: bool
}

#MetadataMatcher_PathSegment: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.MetadataMatcher.PathSegment"

	// oneof segment: exactly one must be set
	{key!: string & strings.MinRunes(1)}
}
