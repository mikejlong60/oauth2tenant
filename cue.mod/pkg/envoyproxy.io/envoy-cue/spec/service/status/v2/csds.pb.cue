// Code generated from envoy/service/status/v2/csds.proto. DO NOT EDIT.
package v2

import (
	core_3 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_1 "envoyproxy.io/envoy-cue/spec/type/matcher"
	v2alpha_2 "envoyproxy.io/envoy-cue/spec/admin/v2alpha"
)

#ClientStatusRequest: {
	"@type": "type.googleapis.com/envoy.service.status.v2.ClientStatusRequest"
	node_matchers?: [...matcher_1.#NodeMatcher]
}

#PerXdsConfig: {
	"@type":              "type.googleapis.com/envoy.service.status.v2.PerXdsConfig"
	status?:              #ConfigStatus
	listener_config?:     v2alpha_2.#ListenersConfigDump
	cluster_config?:      v2alpha_2.#ClustersConfigDump
	route_config?:        v2alpha_2.#RoutesConfigDump
	scoped_route_config?: v2alpha_2.#ScopedRoutesConfigDump
}

#ClientConfig: {
	"@type": "type.googleapis.com/envoy.service.status.v2.ClientConfig"
	node?:   core_3.#Node
	xds_config?: [...#PerXdsConfig]
}

#ClientStatusResponse: {
	"@type": "type.googleapis.com/envoy.service.status.v2.ClientStatusResponse"
	config?: [...#ClientConfig]
}

#ConfigStatus: "UNKNOWN" | "SYNCED" | "NOT_SENT" | "STALE" | "ERROR"
