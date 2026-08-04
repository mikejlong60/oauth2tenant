// Code generated from envoy/type/matcher/metadata.proto. DO NOT EDIT.
package matcher

import (
	"list"
	"strings"
)

// [#next-major-version: MetadataMatcher should use StructMatcher]
#MetadataMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.MetadataMatcher"

	// The filter name to retrieve the Struct from the Metadata.
	filter!: string & strings.MinRunes(1)

	// The path to retrieve the Value from the Struct.
	path!: [...#MetadataMatcher_PathSegment] & list.MinItems(1)

	// The MetadataMatcher is matched if the value retrieved by path is matched to this value.
	value!: #ValueMatcher
}

// Specifies the segment in a path to retrieve value from Metadata.
// Note: Currently it's not supported to retrieve a value from a list in Metadata. This means that
// if the segment key refers to a list, it has to be the last segment in a path.
#MetadataMatcher_PathSegment: {
	"@type": "type.googleapis.com/envoy.type.matcher.MetadataMatcher.PathSegment"

	// oneof segment: exactly one must be set
	// If specified, use the key to retrieve the value in a Struct.
	{key!: string & strings.MinRunes(1)}
}
