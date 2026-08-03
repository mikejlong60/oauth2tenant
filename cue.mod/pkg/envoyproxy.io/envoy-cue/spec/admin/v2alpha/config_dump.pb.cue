// Code generated from envoy/admin/v2alpha/config_dump.proto. DO NOT EDIT.
package v2alpha

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/bootstrap/v2"
)

#ConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.ConfigDump"
	configs?: [...{...}]
}

#UpdateFailureState: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.UpdateFailureState"
	failed_configuration?: {...}
	last_update_attempt?: string
	details?:             string
}

#BootstrapConfigDump: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.BootstrapConfigDump"
	bootstrap?:    v2_1.#Bootstrap
	last_updated?: string
}

#ListenersConfigDump: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.ListenersConfigDump"
	version_info?: string
	static_listeners?: [...#ListenersConfigDump_StaticListener]
	dynamic_listeners?: [...#ListenersConfigDump_DynamicListener]
}

#ListenersConfigDump_StaticListener: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.ListenersConfigDump.StaticListener"
	listener?: {...}
	last_updated?: string
}

#ListenersConfigDump_DynamicListenerState: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.ListenersConfigDump.DynamicListenerState"
	version_info?: string
	listener?: {...}
	last_updated?: string
}

#ListenersConfigDump_DynamicListener: {
	"@type":         "type.googleapis.com/envoy.admin.v2alpha.ListenersConfigDump.DynamicListener"
	name?:           string
	active_state?:   #ListenersConfigDump_DynamicListenerState
	warming_state?:  #ListenersConfigDump_DynamicListenerState
	draining_state?: #ListenersConfigDump_DynamicListenerState
	error_state?:    #UpdateFailureState
}

#ClustersConfigDump: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.ClustersConfigDump"
	version_info?: string
	static_clusters?: [...#ClustersConfigDump_StaticCluster]
	dynamic_active_clusters?: [...#ClustersConfigDump_DynamicCluster]
	dynamic_warming_clusters?: [...#ClustersConfigDump_DynamicCluster]
}

#ClustersConfigDump_StaticCluster: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.ClustersConfigDump.StaticCluster"
	cluster?: {...}
	last_updated?: string
}

#ClustersConfigDump_DynamicCluster: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.ClustersConfigDump.DynamicCluster"
	version_info?: string
	cluster?: {...}
	last_updated?: string
}

#RoutesConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.RoutesConfigDump"
	static_route_configs?: [...#RoutesConfigDump_StaticRouteConfig]
	dynamic_route_configs?: [...#RoutesConfigDump_DynamicRouteConfig]
}

#RoutesConfigDump_StaticRouteConfig: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.RoutesConfigDump.StaticRouteConfig"
	route_config?: {...}
	last_updated?: string
}

#RoutesConfigDump_DynamicRouteConfig: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.RoutesConfigDump.DynamicRouteConfig"
	version_info?: string
	route_config?: {...}
	last_updated?: string
}

#ScopedRoutesConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.ScopedRoutesConfigDump"
	inline_scoped_route_configs?: [...#ScopedRoutesConfigDump_InlineScopedRouteConfigs]
	dynamic_scoped_route_configs?: [...#ScopedRoutesConfigDump_DynamicScopedRouteConfigs]
}

#ScopedRoutesConfigDump_InlineScopedRouteConfigs: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs"
	name?:   string
	scoped_route_configs?: [...{...}]
	last_updated?: string
}

#ScopedRoutesConfigDump_DynamicScopedRouteConfigs: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs"
	name?:         string
	version_info?: string
	scoped_route_configs?: [...{...}]
	last_updated?: string
}

#SecretsConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.SecretsConfigDump"
	static_secrets?: [...#SecretsConfigDump_StaticSecret]
	dynamic_active_secrets?: [...#SecretsConfigDump_DynamicSecret]
	dynamic_warming_secrets?: [...#SecretsConfigDump_DynamicSecret]
}

#SecretsConfigDump_DynamicSecret: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.SecretsConfigDump.DynamicSecret"
	name?:         string
	version_info?: string
	last_updated?: string
	secret?: {...}
}

#SecretsConfigDump_StaticSecret: {
	"@type":       "type.googleapis.com/envoy.admin.v2alpha.SecretsConfigDump.StaticSecret"
	name?:         string
	last_updated?: string
	secret?: {...}
}
