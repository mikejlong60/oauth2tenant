// Code generated from envoy/extensions/transport_sockets/tcp_stats/v3/tcp_stats.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Config: {
	"@type":           "type.googleapis.com/envoy.extensions.transport_sockets.tcp_stats.v3.Config"
	transport_socket!: v3_1.#TransportSocket
	update_period?:    string // TODO(pgv): duration bounds
}
