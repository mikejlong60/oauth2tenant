// Code generated from envoy/extensions/transport_sockets/internal_upstream/v3/internal_upstream.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

#InternalUpstreamTransport: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.internal_upstream.v3.InternalUpstreamTransport"
	passthrough_metadata?: [...#InternalUpstreamTransport_MetadataValueSource]
	transport_socket!: v3_1.#TransportSocket
}

#InternalUpstreamTransport_MetadataValueSource: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.internal_upstream.v3.InternalUpstreamTransport.MetadataValueSource"
	kind!:   v3_2.#MetadataKind
	name!:   string & strings.MinRunes(1)
}
