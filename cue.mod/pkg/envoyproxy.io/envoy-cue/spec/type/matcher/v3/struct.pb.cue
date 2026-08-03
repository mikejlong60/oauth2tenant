// Code generated from envoy/type/matcher/v3/struct.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#StructMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.StructMatcher"
	path!: [...#StructMatcher_PathSegment] & list.MinItems(1)
	value!: #ValueMatcher
}

#StructMatcher_PathSegment: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.StructMatcher.PathSegment"
	key!:    string & strings.MinRunes(1)
}
