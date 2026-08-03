// Code generated from envoy/extensions/matching/common_inputs/network/v3/network_inputs.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#DestinationIPInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.DestinationIPInput"
}

#DestinationPortInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.DestinationPortInput"
}

#SourceIPInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.SourceIPInput"
}

#SourcePortInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.SourcePortInput"
}

#DirectSourceIPInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.DirectSourceIPInput"
}

#SourceTypeInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.SourceTypeInput"
}

#ServerNameInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.ServerNameInput"
}

#TransportProtocolInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.TransportProtocolInput"
}

#ApplicationProtocolInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.ApplicationProtocolInput"
}

#FilterStateInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.FilterStateInput"
	key!:    string & strings.MinRunes(1)
}

#DynamicMetadataInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.DynamicMetadataInput"
	filter!: string & strings.MinRunes(1)
	path!: [...#DynamicMetadataInput_PathSegment] & list.MinItems(1)
}

#DynamicMetadataInput_PathSegment: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.DynamicMetadataInput.PathSegment"
	key!:    string & strings.MinRunes(1)
}

#NetworkNamespaceInput: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.network.v3.NetworkNamespaceInput"
}
