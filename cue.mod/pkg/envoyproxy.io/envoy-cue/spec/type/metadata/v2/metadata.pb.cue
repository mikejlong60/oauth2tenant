// Code generated from envoy/type/metadata/v2/metadata.proto. DO NOT EDIT.
package v2

import (
	"list"
)

#MetadataKey: {
	"@type": "type.googleapis.com/envoy.type.metadata.v2.MetadataKey"
	key!:    string & !=""
	path!: [...#MetadataKey_PathSegment] & list.MinItems(1)
}

#MetadataKey_PathSegment: {
	"@type": "type.googleapis.com/envoy.type.metadata.v2.MetadataKey.PathSegment"

	// oneof segment: exactly one must be set
	{key!: string & !=""}
}

#MetadataKind: {
	"@type": "type.googleapis.com/envoy.type.metadata.v2.MetadataKind"

	// oneof kind: exactly one must be set
	{request!: #MetadataKind_Request} |
	{route!: #MetadataKind_Route} |
	{cluster!: #MetadataKind_Cluster} |
	{host!: #MetadataKind_Host}
}

#MetadataKind_Request: {
	"@type": "type.googleapis.com/envoy.type.metadata.v2.MetadataKind.Request"
}

#MetadataKind_Route: {
	"@type": "type.googleapis.com/envoy.type.metadata.v2.MetadataKind.Route"
}

#MetadataKind_Cluster: {
	"@type": "type.googleapis.com/envoy.type.metadata.v2.MetadataKind.Cluster"
}

#MetadataKind_Host: {
	"@type": "type.googleapis.com/envoy.type.metadata.v2.MetadataKind.Host"
}
