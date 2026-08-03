// Code generated from envoy/config/listener/v3/quic_config.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#QuicProtocolOptions: {
	"@type":                                    "type.googleapis.com/envoy.config.listener.v3.QuicProtocolOptions"
	quic_protocol_options?:                     v3_1.#QuicProtocolOptions
	idle_timeout?:                              string
	crypto_handshake_timeout?:                  string
	enabled?:                                   v3_1.#RuntimeFeatureFlag
	packets_to_read_to_connection_count_ratio?: uint32 & >=1
	crypto_stream_config?:                      v3_1.#TypedExtensionConfig
	proof_source_config?:                       v3_1.#TypedExtensionConfig
	connection_id_generator_config?:            v3_1.#TypedExtensionConfig
	server_preferred_address_config?:           v3_1.#TypedExtensionConfig
	send_disable_active_migration?:             bool
	connection_debug_visitor_config?:           v3_1.#TypedExtensionConfig
	save_cmsg_config?: [...v3_1.#SocketCmsgHeaders] & list.MaxItems(1)
	reject_new_connections?:      bool
	max_sessions_per_event_loop?: uint32 & >0
}
