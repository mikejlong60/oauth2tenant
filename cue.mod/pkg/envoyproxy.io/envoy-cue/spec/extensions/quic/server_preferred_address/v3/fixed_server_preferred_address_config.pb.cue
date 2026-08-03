// Code generated from envoy/extensions/quic/server_preferred_address/v3/fixed_server_preferred_address_config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FixedServerPreferredAddressConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.quic.server_preferred_address.v3.FixedServerPreferredAddressConfig"
	ipv4_address?: string
	ipv4_config?:  #FixedServerPreferredAddressConfig_AddressFamilyConfig
	ipv6_address?: string
	ipv6_config?:  #FixedServerPreferredAddressConfig_AddressFamilyConfig
}

#FixedServerPreferredAddressConfig_AddressFamilyConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.quic.server_preferred_address.v3.FixedServerPreferredAddressConfig.AddressFamilyConfig"
	address?:      v3_1.#SocketAddress
	dnat_address?: v3_1.#SocketAddress
}
