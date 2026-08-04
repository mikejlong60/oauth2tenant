// Code generated from envoy/api/v2/core/address.proto. DO NOT EDIT.
package core

#Pipe: {
	"@type": "type.googleapis.com/envoy.api.v2.core.Pipe"
	path!:   string & !=""
	mode?:   uint32 & <=511
}

#SocketAddress: {
	"@type":        "type.googleapis.com/envoy.api.v2.core.SocketAddress"
	protocol?:      #SocketAddress_Protocol
	address!:       string & !=""
	resolver_name?: string
	ipv4_compat?:   bool

	// oneof port_specifier: exactly one must be set
	{port_value!: uint32 & <=65535} |
	{named_port!: string}
}

#SocketAddress_Protocol: "TCP" | "UDP"

#TcpKeepalive: {
	"@type":             "type.googleapis.com/envoy.api.v2.core.TcpKeepalive"
	keepalive_probes?:   uint32
	keepalive_time?:     uint32
	keepalive_interval?: uint32
}

#BindConfig: {
	"@type":         "type.googleapis.com/envoy.api.v2.core.BindConfig"
	source_address!: #SocketAddress
	freebind?:       bool
	socket_options?: [...#SocketOption]
}

#Address: {
	"@type": "type.googleapis.com/envoy.api.v2.core.Address"

	// oneof address: exactly one must be set
	{socket_address!: #SocketAddress} |
	{pipe!: #Pipe}
}

#CidrRange: {
	"@type":         "type.googleapis.com/envoy.api.v2.core.CidrRange"
	address_prefix!: string & !=""
	prefix_len?:     uint32 & <=128
}
