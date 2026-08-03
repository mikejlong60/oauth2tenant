// Code generated from envoy/config/bootstrap/v2/bootstrap.proto. DO NOT EDIT.
package v2

import (
	auth_6 "envoyproxy.io/envoy-cue/spec/api/v2/auth"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	v2_2 "envoyproxy.io/envoy-cue/spec/config/metrics/v2"
	v2_3 "envoyproxy.io/envoy-cue/spec/config/trace/v2"
	v2_5 "envoyproxy.io/envoy-cue/spec/api/v2"
	v2alpha_4 "envoyproxy.io/envoy-cue/spec/config/overload/v2alpha"
)

#Bootstrap: {
	"@type":            "type.googleapis.com/envoy.config.bootstrap.v2.Bootstrap"
	node?:              core_1.#Node
	static_resources?:  #Bootstrap_StaticResources
	dynamic_resources?: #Bootstrap_DynamicResources
	cluster_manager?:   #ClusterManager
	hds_config?:        core_1.#ApiConfigSource
	flags_path?:        string
	stats_sinks?: [...v2_2.#StatsSink]
	stats_config?:                  v2_2.#StatsConfig
	stats_flush_interval?:          string // TODO(pgv): duration bounds
	watchdog?:                      #Watchdog
	tracing?:                       v2_3.#Tracing
	runtime?:                       #Runtime
	layered_runtime?:               #LayeredRuntime
	admin?:                         #Admin
	overload_manager?:              v2alpha_4.#OverloadManager
	enable_dispatcher_stats?:       bool
	header_prefix?:                 string
	stats_server_version_override?: uint64
	use_tcp_for_dns_lookups?:       bool
}

#Bootstrap_StaticResources: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v2.Bootstrap.StaticResources"
	listeners?: [...v2_5.#Listener]
	clusters?: [...v2_5.#Cluster]
	secrets?: [...auth_6.#Secret]
}

#Bootstrap_DynamicResources: {
	"@type":     "type.googleapis.com/envoy.config.bootstrap.v2.Bootstrap.DynamicResources"
	lds_config?: core_1.#ConfigSource
	cds_config?: core_1.#ConfigSource
	ads_config?: core_1.#ApiConfigSource
}

#Admin: {
	"@type":          "type.googleapis.com/envoy.config.bootstrap.v2.Admin"
	access_log_path?: string
	profile_path?:    string
	address?:         core_1.#Address
	socket_options?: [...core_1.#SocketOption]
}

#ClusterManager: {
	"@type":               "type.googleapis.com/envoy.config.bootstrap.v2.ClusterManager"
	local_cluster_name?:   string
	outlier_detection?:    #ClusterManager_OutlierDetection
	upstream_bind_config?: core_1.#BindConfig
	load_stats_config?:    core_1.#ApiConfigSource
}

#ClusterManager_OutlierDetection: {
	"@type":         "type.googleapis.com/envoy.config.bootstrap.v2.ClusterManager.OutlierDetection"
	event_log_path?: string
	event_service?:  core_1.#EventServiceConfig
}

#Watchdog: {
	"@type":            "type.googleapis.com/envoy.config.bootstrap.v2.Watchdog"
	miss_timeout?:      string
	megamiss_timeout?:  string
	kill_timeout?:      string
	multikill_timeout?: string
}

#Runtime: {
	"@type":                "type.googleapis.com/envoy.config.bootstrap.v2.Runtime"
	symlink_root?:          string
	subdirectory?:          string
	override_subdirectory?: string
	base?: {...}
}

#RuntimeLayer: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v2.RuntimeLayer"
	name!:   string & !=""
	static_layer?: {...}
	disk_layer?:  #RuntimeLayer_DiskLayer
	admin_layer?: #RuntimeLayer_AdminLayer
	rtds_layer?:  #RuntimeLayer_RtdsLayer
}

#RuntimeLayer_DiskLayer: {
	"@type":                 "type.googleapis.com/envoy.config.bootstrap.v2.RuntimeLayer.DiskLayer"
	symlink_root?:           string
	subdirectory?:           string
	append_service_cluster?: bool
}

#RuntimeLayer_AdminLayer: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v2.RuntimeLayer.AdminLayer"
}

#RuntimeLayer_RtdsLayer: {
	"@type":      "type.googleapis.com/envoy.config.bootstrap.v2.RuntimeLayer.RtdsLayer"
	name?:        string
	rtds_config?: core_1.#ConfigSource
}

#LayeredRuntime: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v2.LayeredRuntime"
	layers?: [...#RuntimeLayer]
}
