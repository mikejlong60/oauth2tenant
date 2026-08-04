// Code generated from envoy/type/metadata/v3/metadata.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#MetadataKey: {
	"@type": "type.googleapis.com/envoy.type.metadata.v3.MetadataKey"
	key!:    string & strings.MinRunes(1)
	path!: [...#MetadataKey_PathSegment] & list.MinItems(1)
}

#MetadataKey_PathSegment: {
	"@type": "type.googleapis.com/envoy.type.metadata.v3.MetadataKey.PathSegment"

	// oneof segment: exactly one must be set
	{key!: string & strings.MinRunes(1)}
}

#MetadataKind: {
	"@type": "type.googleapis.com/envoy.type.metadata.v3.MetadataKind"

	// oneof kind: exactly one must be set
	{request!: #MetadataKind_Request} |
	{route!: #MetadataKind_Route} |
	{cluster!: #MetadataKind_Cluster} |
	{host!: #MetadataKind_Host}
}

#MetadataKind_Request: {
	"@type": "type.googleapis.com/envoy.type.metadata.v3.MetadataKind.Request"
}

#MetadataKind_Route: {
	"@type": "type.googleapis.com/envoy.type.metadata.v3.MetadataKind.Route"
}

#MetadataKind_Cluster: {
	"@type": "type.googleapis.com/envoy.type.metadata.v3.MetadataKind.Cluster"
}

#MetadataKind_Host: {
	"@type": "type.googleapis.com/envoy.type.metadata.v3.MetadataKind.Host"
}
