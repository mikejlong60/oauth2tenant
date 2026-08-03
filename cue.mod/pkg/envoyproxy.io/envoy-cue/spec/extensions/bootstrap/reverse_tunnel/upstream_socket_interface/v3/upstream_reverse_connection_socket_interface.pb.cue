// Code generated from envoy/extensions/bootstrap/reverse_tunnel/upstream_socket_interface/v3/upstream_reverse_connection_socket_interface.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#UpstreamReverseConnectionSocketInterface: {
	"@type":                 "type.googleapis.com/envoy.extensions.bootstrap.reverse_tunnel.upstream_socket_interface.v3.UpstreamReverseConnectionSocketInterface"
	stat_prefix?:            string
	ping_failure_threshold?: uint32 & >=1
	enable_detailed_stats?:  bool
	reporter_config?:        v3_1.#TypedExtensionConfig
}
