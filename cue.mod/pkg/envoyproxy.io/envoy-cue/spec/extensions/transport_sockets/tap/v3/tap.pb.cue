// Code generated from envoy/extensions/transport_sockets/tap/v3/tap.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/tap/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Tap: {
	"@type":            "type.googleapis.com/envoy.extensions.transport_sockets.tap.v3.Tap"
	common_config!:     v3_1.#CommonExtensionConfig
	transport_socket!:  v3_2.#TransportSocket
	socket_tap_config?: #SocketTapConfig
}

#SocketTapConfig: {
	"@type":                   "type.googleapis.com/envoy.extensions.transport_sockets.tap.v3.SocketTapConfig"
	set_connection_per_event?: bool
	stats_prefix?:             string
}
