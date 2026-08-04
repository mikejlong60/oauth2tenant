// Code generated from envoy/extensions/transport_sockets/proxy_protocol/v3/upstream_proxy_protocol.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Configuration for PROXY protocol socket
#ProxyProtocolUpstreamTransport: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.proxy_protocol.v3.ProxyProtocolUpstreamTransport"

	// The PROXY protocol settings
	config?: v3_1.#ProxyProtocolConfig

	// The underlying transport socket being wrapped.
	transport_socket!: v3_1.#TransportSocket

	// If this is set to true, the null addresses are allowed in the PROXY protocol header.
	// The proxy protocol header encodes the null addresses to AF_UNSPEC.
	// [#not-implemented-hide:]
	allow_unspecified_address?: bool

	// If true, all the TLVs are encoded in the connection pool key.
	// [#not-implemented-hide:]
	tlv_as_pool_key?: bool
}
