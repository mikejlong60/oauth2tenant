// Code generated from envoy/extensions/transport_sockets/proxy_protocol/v3/upstream_proxy_protocol.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ProxyProtocolUpstreamTransport: {
	"@type":                    "type.googleapis.com/envoy.extensions.transport_sockets.proxy_protocol.v3.ProxyProtocolUpstreamTransport"
	config?:                    v3_1.#ProxyProtocolConfig
	transport_socket!:          v3_1.#TransportSocket
	allow_unspecified_address?: bool
	tlv_as_pool_key?:           bool
}
