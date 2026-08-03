// Code generated from envoy/service/status/v3/csds.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/admin/v3"
)

#ClientStatusRequest: {
	"@type": "type.googleapis.com/envoy.service.status.v3.ClientStatusRequest"
	node_matchers?: [...v3_1.#NodeMatcher]
	node?:                      v3_2.#Node
	exclude_resource_contents?: bool
}

#PerXdsConfig: {
	"@type":              "type.googleapis.com/envoy.service.status.v3.PerXdsConfig"
	status?:              #ConfigStatus
	client_status?:       #ClientConfigStatus
	listener_config?:     v3_3.#ListenersConfigDump
	cluster_config?:      v3_3.#ClustersConfigDump
	route_config?:        v3_3.#RoutesConfigDump
	scoped_route_config?: v3_3.#ScopedRoutesConfigDump
	endpoint_config?:     v3_3.#EndpointsConfigDump
}

#ClientConfig: {
	"@type": "type.googleapis.com/envoy.service.status.v3.ClientConfig"
	node?:   v3_2.#Node
	xds_config?: [...#PerXdsConfig]
	generic_xds_configs?: [...#ClientConfig_GenericXdsConfig]
	client_scope?: string
}

#ClientConfig_GenericXdsConfig: {
	"@type":       "type.googleapis.com/envoy.service.status.v3.ClientConfig.GenericXdsConfig"
	type_url?:     string
	name?:         string
	version_info?: string
	xds_config?: {...}
	last_updated?:       string
	config_status?:      #ConfigStatus
	client_status?:      v3_3.#ClientResourceStatus
	error_state?:        v3_3.#UpdateFailureState
	is_static_resource?: bool
}

#ClientStatusResponse: {
	"@type": "type.googleapis.com/envoy.service.status.v3.ClientStatusResponse"
	config?: [...#ClientConfig]
}

#ConfigStatus: "UNKNOWN" | "SYNCED" | "NOT_SENT" | "STALE" | "ERROR"

#ClientConfigStatus: "CLIENT_UNKNOWN" | "CLIENT_REQUESTED" | "CLIENT_ACKED" | "CLIENT_NACKED" | "CLIENT_RECEIVED_ERROR"
