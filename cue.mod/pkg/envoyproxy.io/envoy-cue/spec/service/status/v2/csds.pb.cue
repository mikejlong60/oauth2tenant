// Code generated from envoy/service/status/v2/csds.proto. DO NOT EDIT.
package v2

import (
	core_3 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_1 "envoyproxy.io/envoy-cue/spec/type/matcher"
	v2alpha_2 "envoyproxy.io/envoy-cue/spec/admin/v2alpha"
)

// Request for client status of clients identified by a list of NodeMatchers.
#ClientStatusRequest: {
	"@type": "type.googleapis.com/envoy.service.status.v2.ClientStatusRequest"

	// Management server can use these match criteria to identify clients.
	// The match follows OR semantics.
	node_matchers?: [...matcher_1.#NodeMatcher]
}

// Detailed config (per xDS) with status.
// [#next-free-field: 6]
#PerXdsConfig: {
	"@type": "type.googleapis.com/envoy.service.status.v2.PerXdsConfig"
	status?: #ConfigStatus

	// oneof per_xds_config: at most one may be set
	*{} |
	{listener_config!: v2alpha_2.#ListenersConfigDump} |
	{cluster_config!: v2alpha_2.#ClustersConfigDump} |
	{route_config!: v2alpha_2.#RoutesConfigDump} |
	{scoped_route_config!: v2alpha_2.#ScopedRoutesConfigDump}
}

// All xds configs for a particular client.
#ClientConfig: {
	"@type": "type.googleapis.com/envoy.service.status.v2.ClientConfig"

	// Node for a particular client.
	node?: core_3.#Node
	xds_config?: [...#PerXdsConfig]
}

#ClientStatusResponse: {
	"@type": "type.googleapis.com/envoy.service.status.v2.ClientStatusResponse"

	// Client configs for the clients specified in the ClientStatusRequest.
	config?: [...#ClientConfig]
}

// Status of a config.
#ConfigStatus:
	// Status info is not available/unknown.
	"UNKNOWN" |

	// Management server has sent the config to client and received ACK.
	"SYNCED" |

	// Config is not sent.
	"NOT_SENT" |

	// Management server has sent the config to client but hasn’t received
	// ACK/NACK.
	"STALE" |

	// Management server has sent the config to client but received NACK.
	"ERROR"
