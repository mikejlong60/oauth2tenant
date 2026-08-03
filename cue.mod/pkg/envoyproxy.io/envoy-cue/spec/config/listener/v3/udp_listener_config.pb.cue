// Code generated from envoy/config/listener/v3/udp_listener_config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#UdpListenerConfig: {
	"@type":                          "type.googleapis.com/envoy.config.listener.v3.UdpListenerConfig"
	downstream_socket_config?:        v3_1.#UdpSocketConfig
	quic_options?:                    #QuicProtocolOptions
	udp_packet_packet_writer_config?: v3_1.#TypedExtensionConfig
}

#ActiveRawUdpListenerConfig: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.ActiveRawUdpListenerConfig"
}
