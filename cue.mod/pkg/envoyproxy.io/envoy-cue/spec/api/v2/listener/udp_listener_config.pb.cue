// Code generated from envoy/api/v2/listener/udp_listener_config.proto. DO NOT EDIT.
package listener

#UdpListenerConfig: {
	"@type":            "type.googleapis.com/envoy.api.v2.listener.UdpListenerConfig"
	udp_listener_name?: string

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#ActiveRawUdpListenerConfig: {
	"@type": "type.googleapis.com/envoy.api.v2.listener.ActiveRawUdpListenerConfig"
}
