// Code generated from envoy/config/core/v3/address.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Pipe: {
	"@type": "type.googleapis.com/envoy.config.core.v3.Pipe"
	path!:   string & strings.MinRunes(1)
	mode?:   uint32 & <=511
}

#EnvoyInternalAddress: {
	"@type":               "type.googleapis.com/envoy.config.core.v3.EnvoyInternalAddress"
	server_listener_name?: string
	endpoint_id?:          string
}

#SocketAddress: {
	"@type":                     "type.googleapis.com/envoy.config.core.v3.SocketAddress"
	protocol?:                   #SocketAddress_Protocol
	address!:                    string & strings.MinRunes(1)
	port_value?:                 uint32 & <=65535
	named_port?:                 string
	resolver_name?:              string
	ipv4_compat?:                bool
	network_namespace_filepath?: string
}

#SocketAddress_Protocol: "TCP" | "UDP"

#TcpKeepalive: {
	"@type":             "type.googleapis.com/envoy.config.core.v3.TcpKeepalive"
	keepalive_probes?:   uint32
	keepalive_time?:     uint32
	keepalive_interval?: uint32
}

#ExtraSourceAddress: {
	"@type":         "type.googleapis.com/envoy.config.core.v3.ExtraSourceAddress"
	address!:        #SocketAddress
	socket_options?: #SocketOptionsOverride
}

#BindConfig: {
	"@type":         "type.googleapis.com/envoy.config.core.v3.BindConfig"
	source_address?: #SocketAddress
	freebind?:       bool
	socket_options?: [...#SocketOption]
	extra_source_addresses?: [...#ExtraSourceAddress]
	additional_source_addresses?: [...#SocketAddress]
	local_address_selector?: #TypedExtensionConfig
}

#Address: {
	"@type":                 "type.googleapis.com/envoy.config.core.v3.Address"
	socket_address?:         #SocketAddress
	pipe?:                   #Pipe
	envoy_internal_address?: #EnvoyInternalAddress
}

#CidrRange: {
	"@type":         "type.googleapis.com/envoy.config.core.v3.CidrRange"
	address_prefix!: string & strings.MinRunes(1)
	prefix_len?:     uint32 & <=128
}
