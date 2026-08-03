// Code generated from envoy/extensions/transport_sockets/quic/v3/quic_transport.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

#QuicDownstreamTransport: {
	"@type":                 "type.googleapis.com/envoy.extensions.transport_sockets.quic.v3.QuicDownstreamTransport"
	downstream_tls_context!: v3_1.#DownstreamTlsContext
	enable_early_data?:      bool
}

#QuicUpstreamTransport: {
	"@type":               "type.googleapis.com/envoy.extensions.transport_sockets.quic.v3.QuicUpstreamTransport"
	upstream_tls_context!: v3_1.#UpstreamTlsContext
}
