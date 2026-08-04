// Code generated from envoy/type/matcher/struct.proto. DO NOT EDIT.
package matcher

import (
	"list"
	"strings"
)

#StructMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.StructMatcher"
	path!: [...#StructMatcher_PathSegment] & list.MinItems(1)
	value!: #ValueMatcher
}

#StructMatcher_PathSegment: {
	"@type": "type.googleapis.com/envoy.type.matcher.StructMatcher.PathSegment"

	// oneof segment: exactly one must be set
	{key!: string & strings.MinRunes(1)}
}
