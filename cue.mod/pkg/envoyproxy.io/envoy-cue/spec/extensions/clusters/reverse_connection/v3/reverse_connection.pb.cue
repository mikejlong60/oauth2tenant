// Code generated from envoy/extensions/clusters/reverse_connection/v3/reverse_connection.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// Configuration for a cluster of type REVERSE_CONNECTION.
#ReverseConnectionClusterConfig: {
	"@type": "type.googleapis.com/envoy.extensions.clusters.reverse_connection.v3.ReverseConnectionClusterConfig"

	// Time interval after which Envoy removes unused dynamic hosts created for reverse connections.
	// Hosts that are not referenced by any connection pool are deleted during cleanup.
	//
	// If unset, Envoy uses a default of 60s.
	cleanup_interval?: string // TODO(pgv): duration bounds

	// Host identifier format string.
	//
	// This format string is evaluated against the downstream request context to compute
	// the host identifier for selecting the reverse connection endpoint. The format string
	// supports Envoy's standard formatter syntax, including:
	//
	// * ``%REQ(header-name)%``: Extract request header value.
	// * ``%DYNAMIC_METADATA(namespace:key)%``: Extract dynamic metadata value.
	// * ``%CEL(expression)%``: Evaluate CEL expression.
	// * ``%DOWNSTREAM_REMOTE_ADDRESS%``: Downstream connection address.
	// * ``%DOWNSTREAM_LOCAL_ADDRESS%``: Downstream local address.
	// * Plain text and combinations of the above.
	//
	// Examples:
	//
	// * ``%REQ(x-remote-node-id)%``: Use the value of the ``x-remote-node-id`` header.
	// * ``%REQ(host):EXTRACT_FIRST_PART%``: Extract the first part of the Host header before a dot.
	// * ``%CEL(request.headers['x-node-id'] | orValue('default'))%``: Use CEL with fallback.
	// * ``node-%REQ(x-tenant-id)%-%REQ(x-region)%``: Combine multiple values.
	//
	// If the format string evaluates to an empty value, the request will not be routed.
	host_id_format!: string & strings.MinRunes(1)
}
