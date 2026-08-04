// Code generated from envoy/type/matcher/metadata.proto. DO NOT EDIT.
package matcher

import (
	"list"
	"strings"
)

#MetadataMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.MetadataMatcher"
	filter!: string & strings.MinRunes(1)
	path!: [...#MetadataMatcher_PathSegment] & list.MinItems(1)
	value!: #ValueMatcher
}

#MetadataMatcher_PathSegment: {
	"@type": "type.googleapis.com/envoy.type.matcher.MetadataMatcher.PathSegment"

	// oneof segment: exactly one must be set
	{key!: string & strings.MinRunes(1)}
}
