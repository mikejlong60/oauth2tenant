// Code generated from envoy/extensions/bootstrap/reverse_tunnel/downstream_socket_interface/v3/downstream_reverse_connection_socket_interface.proto. DO NOT EDIT.
package v3

#DownstreamReverseConnectionSocketInterface: {
	"@type":                "type.googleapis.com/envoy.extensions.bootstrap.reverse_tunnel.downstream_socket_interface.v3.DownstreamReverseConnectionSocketInterface"
	stat_prefix?:           string
	enable_detailed_stats?: bool
	http_handshake?:        #DownstreamReverseConnectionSocketInterface_HttpHandshakeConfig
}

#DownstreamReverseConnectionSocketInterface_HttpHandshakeConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.bootstrap.reverse_tunnel.downstream_socket_interface.v3.DownstreamReverseConnectionSocketInterface.HttpHandshakeConfig"
	request_path?: string
}
