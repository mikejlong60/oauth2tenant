// Code generated from envoy/extensions/quic/server_preferred_address/v3/datasource.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#DataSourceServerPreferredAddressConfig: {
	"@type":      "type.googleapis.com/envoy.extensions.quic.server_preferred_address.v3.DataSourceServerPreferredAddressConfig"
	ipv4_config?: #DataSourceServerPreferredAddressConfig_AddressFamilyConfig
	ipv6_config?: #DataSourceServerPreferredAddressConfig_AddressFamilyConfig
}

#DataSourceServerPreferredAddressConfig_AddressFamilyConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.quic.server_preferred_address.v3.DataSourceServerPreferredAddressConfig.AddressFamilyConfig"
	address!:      v3_1.#DataSource
	port?:         v3_1.#DataSource
	dnat_address?: v3_1.#DataSource
}
