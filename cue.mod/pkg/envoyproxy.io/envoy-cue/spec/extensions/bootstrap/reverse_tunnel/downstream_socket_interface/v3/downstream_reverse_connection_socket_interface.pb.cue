// Code generated from envoy/extensions/bootstrap/reverse_tunnel/downstream_socket_interface/v3/downstream_reverse_connection_socket_interface.proto. DO NOT EDIT.
package v3

// Configuration for the downstream reverse connection socket interface.
// This interface initiates reverse connections to upstream Envoys and provides
// them as socket connections for downstream requests.
#DownstreamReverseConnectionSocketInterface: {
	"@type": "type.googleapis.com/envoy.extensions.bootstrap.reverse_tunnel.downstream_socket_interface.v3.DownstreamReverseConnectionSocketInterface"

	// Stat prefix to be used for downstream reverse connection socket interface stats.
	stat_prefix?: string

	// Enable detailed per-host and per-cluster statistics.
	// When enabled, emits hidden statistics for individual hosts and clusters.
	// Defaults to ``false``.
	enable_detailed_stats?: bool

	// Optional HTTP handshake configuration. When unset, the initiator envoy uses the defaults
	// provided by ``HttpHandshakeConfig``.
	http_handshake?: #DownstreamReverseConnectionSocketInterface_HttpHandshakeConfig
}

// HTTP handshake settings for initiator envoy initiated reverse tunnels.
#DownstreamReverseConnectionSocketInterface_HttpHandshakeConfig: {
	"@type": "type.googleapis.com/envoy.extensions.bootstrap.reverse_tunnel.downstream_socket_interface.v3.DownstreamReverseConnectionSocketInterface.HttpHandshakeConfig"

	// Request path used when issuing the HTTP reverse-connection handshake. Defaults to
	// "/reverse_connections/request".
	request_path?: string
}
