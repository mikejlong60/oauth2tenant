// Code generated from envoy/extensions/transport_sockets/starttls/v3/starttls.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/raw_buffer/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

#StartTlsConfig: {
	"@type":                  "type.googleapis.com/envoy.extensions.transport_sockets.starttls.v3.StartTlsConfig"
	cleartext_socket_config?: v3_1.#RawBuffer
	tls_socket_config!:       v3_2.#DownstreamTlsContext
}

#UpstreamStartTlsConfig: {
	"@type":                  "type.googleapis.com/envoy.extensions.transport_sockets.starttls.v3.UpstreamStartTlsConfig"
	cleartext_socket_config?: v3_1.#RawBuffer
	tls_socket_config!:       v3_2.#UpstreamTlsContext
}
