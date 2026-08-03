// Code generated from envoy/admin/v3/config_dump_shared.proto. DO NOT EDIT.
package v3

#UpdateFailureState: {
	"@type": "type.googleapis.com/envoy.admin.v3.UpdateFailureState"
	failed_configuration?: {...}
	last_update_attempt?: string
	details?:             string
	version_info?:        string
}

#ListenersConfigDump: {
	"@type":       "type.googleapis.com/envoy.admin.v3.ListenersConfigDump"
	version_info?: string
	static_listeners?: [...#ListenersConfigDump_StaticListener]
	dynamic_listeners?: [...#ListenersConfigDump_DynamicListener]
}

#ListenersConfigDump_StaticListener: {
	"@type": "type.googleapis.com/envoy.admin.v3.ListenersConfigDump.StaticListener"
	listener?: {...}
	last_updated?: string
}

#ListenersConfigDump_DynamicListenerState: {
	"@type":       "type.googleapis.com/envoy.admin.v3.ListenersConfigDump.DynamicListenerState"
	version_info?: string
	listener?: {...}
	last_updated?: string
}

#ListenersConfigDump_DynamicListener: {
	"@type":         "type.googleapis.com/envoy.admin.v3.ListenersConfigDump.DynamicListener"
	name?:           string
	active_state?:   #ListenersConfigDump_DynamicListenerState
	warming_state?:  #ListenersConfigDump_DynamicListenerState
	draining_state?: #ListenersConfigDump_DynamicListenerState
	error_state?:    #UpdateFailureState
	client_status?:  #ClientResourceStatus
}

#ClustersConfigDump: {
	"@type":       "type.googleapis.com/envoy.admin.v3.ClustersConfigDump"
	version_info?: string
	static_clusters?: [...#ClustersConfigDump_StaticCluster]
	dynamic_active_clusters?: [...#ClustersConfigDump_DynamicCluster]
	dynamic_warming_clusters?: [...#ClustersConfigDump_DynamicCluster]
}

#ClustersConfigDump_StaticCluster: {
	"@type": "type.googleapis.com/envoy.admin.v3.ClustersConfigDump.StaticCluster"
	cluster?: {...}
	last_updated?: string
}

#ClustersConfigDump_DynamicCluster: {
	"@type":       "type.googleapis.com/envoy.admin.v3.ClustersConfigDump.DynamicCluster"
	version_info?: string
	cluster?: {...}
	last_updated?:  string
	error_state?:   #UpdateFailureState
	client_status?: #ClientResourceStatus
}

#RoutesConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v3.RoutesConfigDump"
	static_route_configs?: [...#RoutesConfigDump_StaticRouteConfig]
	dynamic_route_configs?: [...#RoutesConfigDump_DynamicRouteConfig]
}

#RoutesConfigDump_StaticRouteConfig: {
	"@type": "type.googleapis.com/envoy.admin.v3.RoutesConfigDump.StaticRouteConfig"
	route_config?: {...}
	last_updated?: string
}

#RoutesConfigDump_DynamicRouteConfig: {
	"@type":       "type.googleapis.com/envoy.admin.v3.RoutesConfigDump.DynamicRouteConfig"
	version_info?: string
	route_config?: {...}
	last_updated?:  string
	error_state?:   #UpdateFailureState
	client_status?: #ClientResourceStatus
}

#ScopedRoutesConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v3.ScopedRoutesConfigDump"
	inline_scoped_route_configs?: [...#ScopedRoutesConfigDump_InlineScopedRouteConfigs]
	dynamic_scoped_route_configs?: [...#ScopedRoutesConfigDump_DynamicScopedRouteConfigs]
}

#ScopedRoutesConfigDump_InlineScopedRouteConfigs: {
	"@type": "type.googleapis.com/envoy.admin.v3.ScopedRoutesConfigDump.InlineScopedRouteConfigs"
	name?:   string
	scoped_route_configs?: [...{...}]
	last_updated?: string
}

#ScopedRoutesConfigDump_DynamicScopedRouteConfigs: {
	"@type":       "type.googleapis.com/envoy.admin.v3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs"
	name?:         string
	version_info?: string
	scoped_route_configs?: [...{...}]
	last_updated?:  string
	error_state?:   #UpdateFailureState
	client_status?: #ClientResourceStatus
}

#EndpointsConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v3.EndpointsConfigDump"
	static_endpoint_configs?: [...#EndpointsConfigDump_StaticEndpointConfig]
	dynamic_endpoint_configs?: [...#EndpointsConfigDump_DynamicEndpointConfig]
}

#EndpointsConfigDump_StaticEndpointConfig: {
	"@type": "type.googleapis.com/envoy.admin.v3.EndpointsConfigDump.StaticEndpointConfig"
	endpoint_config?: {...}
	last_updated?: string
}

#EndpointsConfigDump_DynamicEndpointConfig: {
	"@type":       "type.googleapis.com/envoy.admin.v3.EndpointsConfigDump.DynamicEndpointConfig"
	version_info?: string
	endpoint_config?: {...}
	last_updated?:  string
	error_state?:   #UpdateFailureState
	client_status?: #ClientResourceStatus
}

#EcdsConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v3.EcdsConfigDump"
	ecds_filters?: [...#EcdsConfigDump_EcdsFilterConfig]
}

#EcdsConfigDump_EcdsFilterConfig: {
	"@type":       "type.googleapis.com/envoy.admin.v3.EcdsConfigDump.EcdsFilterConfig"
	version_info?: string
	ecds_filter?: {...}
	last_updated?:  string
	error_state?:   #UpdateFailureState
	client_status?: #ClientResourceStatus
}

#ClientResourceStatus: "UNKNOWN" | "REQUESTED" | "DOES_NOT_EXIST" | "ACKED" | "NACKED" | "RECEIVED_ERROR" | "TIMEOUT"
