// Code generated from envoy/api/v2/listener/udp_listener_config.proto. DO NOT EDIT.
package listener

#UdpListenerConfig: {
	"@type": "type.googleapis.com/envoy.api.v2.listener.UdpListenerConfig"

	// Used to look up UDP listener factory, matches "raw_udp_listener" or
	// "quic_listener" to create a specific udp listener.
	// If not specified, treat as "raw_udp_listener".
	udp_listener_name?: string

	// Used to create a specific listener factory. To some factory, e.g.
	// "raw_udp_listener", config is not needed.
	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#ActiveRawUdpListenerConfig: {
	"@type": "type.googleapis.com/envoy.api.v2.listener.ActiveRawUdpListenerConfig"
}
