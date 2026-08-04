// Code generated from envoy/config/transport_socket/tap/v2alpha/tap.proto. DO NOT EDIT.
package v2alpha

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/config/common/tap/v2alpha"
)

// Configuration for tap transport socket. This wraps another transport socket, providing the
// ability to interpose and record in plain text any traffic that is surfaced to Envoy.
#Tap: {
	"@type": "type.googleapis.com/envoy.config.transport_socket.tap.v2alpha.Tap"

	// Common configuration for the tap transport socket.
	common_config!: v2alpha_1.#CommonExtensionConfig

	// The underlying transport socket being wrapped.
	transport_socket!: core_2.#TransportSocket
}
