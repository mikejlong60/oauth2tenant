// Code generated from envoy/extensions/quic/connection_id_generator/quic_lb/v3/quic_lb.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

#Config: {
	"@type":                    "type.googleapis.com/envoy.extensions.quic.connection_id_generator.quic_lb.v3.Config"
	server_id!:                 v3_1.#DataSource
	server_id_base64_encoded?:  bool
	expected_server_id_length?: uint32 & <=18
	nonce_length_bytes?:        uint32 & >=4 & <=16
	encryption_parameters!:     v3_2.#SdsSecretConfig
	unencrypted_mode?:          bool
}
