// Code generated from envoy/extensions/transport_sockets/starttls/v3/starttls.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/raw_buffer/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

// Configuration for a downstream StartTls transport socket.
// StartTls transport socket wraps two sockets:
// * raw_buffer socket which is used at the beginning of the session
// * TLS socket used when a protocol negotiates a switch to encrypted traffic.
#StartTlsConfig: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.starttls.v3.StartTlsConfig"

	// (optional) Configuration for clear-text socket used at the beginning of the session.
	cleartext_socket_config?: v3_1.#RawBuffer

	// Configuration for a downstream TLS socket.
	tls_socket_config!: v3_2.#DownstreamTlsContext
}

// Configuration for an upstream StartTls transport socket.
// StartTls transport socket wraps two sockets:
// * raw_buffer socket which is used at the beginning of the session
// * TLS socket used when a protocol negotiates a switch to encrypted traffic.
#UpstreamStartTlsConfig: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.starttls.v3.UpstreamStartTlsConfig"

	// (optional) Configuration for clear-text socket used at the beginning of the session.
	cleartext_socket_config?: v3_1.#RawBuffer

	// Configuration for an upstream TLS socket.
	tls_socket_config!: v3_2.#UpstreamTlsContext
}
