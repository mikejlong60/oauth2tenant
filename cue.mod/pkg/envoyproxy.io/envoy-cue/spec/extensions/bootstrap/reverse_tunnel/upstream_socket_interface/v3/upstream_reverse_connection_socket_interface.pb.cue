// Code generated from envoy/extensions/bootstrap/reverse_tunnel/upstream_socket_interface/v3/upstream_reverse_connection_socket_interface.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Configuration for the upstream reverse connection socket interface.
#UpstreamReverseConnectionSocketInterface: {
	"@type": "type.googleapis.com/envoy.extensions.bootstrap.reverse_tunnel.upstream_socket_interface.v3.UpstreamReverseConnectionSocketInterface"

	// Stat prefix for upstream reverse connection socket interface stats.
	stat_prefix?: string

	// Number of consecutive ping failures before an idle reverse connection socket is marked dead.
	// Defaults to 3 if unset. Must be at least 1.
	ping_failure_threshold?: uint32 & >=1

	// Enable detailed per-node and per-cluster statistics.
	// When enabled, emits hidden statistics for individual nodes and clusters.
	// Defaults to false.
	enable_detailed_stats?: bool

	// Optional configuration for a tunnel reporting extension. When provided,
	// the socket interface instantiates a reporter via the configured factory.
	// If unset, no reporting is done.
	reporter_config?: v3_1.#TypedExtensionConfig
}
