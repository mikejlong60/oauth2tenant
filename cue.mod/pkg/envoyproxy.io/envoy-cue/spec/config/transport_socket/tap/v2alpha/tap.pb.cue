// Code generated from envoy/config/transport_socket/tap/v2alpha/tap.proto. DO NOT EDIT.
package v2alpha

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/config/common/tap/v2alpha"
)

#Tap: {
	"@type":           "type.googleapis.com/envoy.config.transport_socket.tap.v2alpha.Tap"
	common_config!:    v2alpha_1.#CommonExtensionConfig
	transport_socket!: core_2.#TransportSocket
}
