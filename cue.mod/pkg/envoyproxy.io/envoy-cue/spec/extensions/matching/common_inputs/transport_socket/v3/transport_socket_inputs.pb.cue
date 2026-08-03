// Code generated from envoy/extensions/matching/common_inputs/transport_socket/v3/transport_socket_inputs.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#EndpointMetadataInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.EndpointMetadataInput"
	filter?: string
	path!: [...#EndpointMetadataInput_PathSegment] & list.MinItems(1)
}

#EndpointMetadataInput_PathSegment: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.EndpointMetadataInput.PathSegment"
	key!:    string & strings.MinRunes(1)
}

#LocalityMetadataInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.LocalityMetadataInput"
	filter?: string
	path!: [...#LocalityMetadataInput_PathSegment] & list.MinItems(1)
}

#LocalityMetadataInput_PathSegment: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.LocalityMetadataInput.PathSegment"
	key!:    string & strings.MinRunes(1)
}

#FilterStateInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.FilterStateInput"
	key!:    string & strings.MinRunes(1)
}

#TransportSocketNameAction: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.TransportSocketNameAction"
	name!:   string & strings.MinRunes(1)
}
