// Code generated from envoy/config/bootstrap/v3/bootstrap.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_10 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/metrics/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/trace/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/overload/v3"
	v3_5 "envoyproxy.io/envoy-cue/spec/config/listener/v3"
	v3_6 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
	v3_7 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
	v3_8 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
	v3_9 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#Bootstrap: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.Bootstrap"
	node?:   v3_1.#Node
	node_context_params?: [...string]
	static_resources?:  #Bootstrap_StaticResources
	dynamic_resources?: #Bootstrap_DynamicResources
	cluster_manager?:   #ClusterManager
	hds_config?:        v3_1.#ApiConfigSource
	flags_path?:        string
	stats_sinks?: [...v3_2.#StatsSink]
	deferred_stat_options?:         #Bootstrap_DeferredStatOptions
	stats_config?:                  v3_2.#StatsConfig
	stats_flush_interval?:          string // TODO(pgv): duration bounds
	stats_flush_on_admin!:          bool & true
	stats_eviction_interval?:       string // TODO(pgv): duration bounds
	watchdog?:                      #Watchdog
	watchdogs?:                     #Watchdogs
	tracing?:                       v3_3.#Tracing
	layered_runtime?:               #LayeredRuntime
	admin?:                         #Admin
	overload_manager?:              v3_4.#OverloadManager
	enable_dispatcher_stats?:       bool
	header_prefix?:                 string
	stats_server_version_override?: uint64
	use_tcp_for_dns_lookups?:       bool
	dns_resolution_config?:         v3_1.#DnsResolutionConfig
	typed_dns_resolver_config?:     v3_1.#TypedExtensionConfig
	bootstrap_extensions?: [...v3_1.#TypedExtensionConfig]
	fatal_actions?: [...#FatalAction]
	config_sources?: [...v3_1.#ConfigSource]
	default_config_source?:    v3_1.#ConfigSource
	default_socket_interface?: string
	certificate_provider_instances?: {[string]: v3_1.#TypedExtensionConfig}
	inline_headers?: [...#CustomInlineHeader]
	perf_tracing_file_path?:           string
	default_regex_engine?:             v3_1.#TypedExtensionConfig
	xds_delegate_extension?:           v3_1.#TypedExtensionConfig
	xds_config_tracker_extension?:     v3_1.#TypedExtensionConfig
	listener_manager?:                 v3_1.#TypedExtensionConfig
	application_log_config?:           #Bootstrap_ApplicationLogConfig
	grpc_async_client_manager_config?: #Bootstrap_GrpcAsyncClientManagerConfig
	memory_allocator_manager?:         #MemoryAllocatorManager
}

#Bootstrap_StaticResources: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.Bootstrap.StaticResources"
	listeners?: [...v3_5.#Listener]
	clusters?: [...v3_6.#Cluster]
	secrets?: [...v3_7.#Secret]
}

#Bootstrap_DynamicResources: {
	"@type":                "type.googleapis.com/envoy.config.bootstrap.v3.Bootstrap.DynamicResources"
	lds_config?:            v3_1.#ConfigSource
	lds_resources_locator?: string
	cds_config?:            v3_1.#ConfigSource
	cds_resources_locator?: string
	ads_config?:            v3_1.#ApiConfigSource
}

#Bootstrap_ApplicationLogConfig: {
	"@type":     "type.googleapis.com/envoy.config.bootstrap.v3.Bootstrap.ApplicationLogConfig"
	log_format?: #Bootstrap_ApplicationLogConfig_LogFormat
}

#Bootstrap_ApplicationLogConfig_LogFormat: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.Bootstrap.ApplicationLogConfig.LogFormat"
	json_format?: {...}
	text_format?: string
}

#Bootstrap_DeferredStatOptions: {
	"@type":                         "type.googleapis.com/envoy.config.bootstrap.v3.Bootstrap.DeferredStatOptions"
	enable_deferred_creation_stats?: bool
}

#Bootstrap_GrpcAsyncClientManagerConfig: {
	"@type":                         "type.googleapis.com/envoy.config.bootstrap.v3.Bootstrap.GrpcAsyncClientManagerConfig"
	max_cached_entry_idle_duration?: string // TODO(pgv): duration bounds
}

#Admin: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.Admin"
	access_log?: [...v3_8.#AccessLog]
	access_log_path?: string
	profile_path?:    string
	address?:         v3_1.#Address
	socket_options?: [...v3_1.#SocketOption]
	ignore_global_conn_limit?: bool
	allow_paths?: [...v3_9.#StringMatcher]
}

#ClusterManager: {
	"@type":                           "type.googleapis.com/envoy.config.bootstrap.v3.ClusterManager"
	local_cluster_name?:               string
	outlier_detection?:                #ClusterManager_OutlierDetection
	upstream_bind_config?:             v3_1.#BindConfig
	load_stats_config?:                v3_1.#ApiConfigSource
	enable_deferred_cluster_creation?: bool
}

#ClusterManager_OutlierDetection: {
	"@type":         "type.googleapis.com/envoy.config.bootstrap.v3.ClusterManager.OutlierDetection"
	event_log_path?: string
	event_service?:  v3_1.#EventServiceConfig
}

#Watchdogs: {
	"@type":               "type.googleapis.com/envoy.config.bootstrap.v3.Watchdogs"
	main_thread_watchdog?: #Watchdog
	worker_watchdog?:      #Watchdog
}

#Watchdog: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.Watchdog"
	actions?: [...#Watchdog_WatchdogAction]
	miss_timeout?:            string
	megamiss_timeout?:        string
	kill_timeout?:            string
	max_kill_timeout_jitter?: string // TODO(pgv): duration bounds
	multikill_timeout?:       string
	multikill_threshold?:     v3_10.#Percent
}

#Watchdog_WatchdogAction: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.Watchdog.WatchdogAction"
	config?: v3_1.#TypedExtensionConfig
	event?:  #Watchdog_WatchdogAction_WatchdogEvent
}

#Watchdog_WatchdogAction_WatchdogEvent: "UNKNOWN" | "KILL" | "MULTIKILL" | "MEGAMISS" | "MISS"

#FatalAction: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.FatalAction"
	config?: v3_1.#TypedExtensionConfig
}

#Runtime: {
	"@type":                "type.googleapis.com/envoy.config.bootstrap.v3.Runtime"
	symlink_root?:          string
	subdirectory?:          string
	override_subdirectory?: string
	base?: {...}
}

#RuntimeLayer: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.RuntimeLayer"
	name!:   string & strings.MinRunes(1)
	static_layer?: {...}
	disk_layer?:  #RuntimeLayer_DiskLayer
	admin_layer?: #RuntimeLayer_AdminLayer
	rtds_layer?:  #RuntimeLayer_RtdsLayer
}

#RuntimeLayer_DiskLayer: {
	"@type":                 "type.googleapis.com/envoy.config.bootstrap.v3.RuntimeLayer.DiskLayer"
	symlink_root?:           string
	subdirectory?:           string
	append_service_cluster?: bool
}

#RuntimeLayer_AdminLayer: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.RuntimeLayer.AdminLayer"
}

#RuntimeLayer_RtdsLayer: {
	"@type":      "type.googleapis.com/envoy.config.bootstrap.v3.RuntimeLayer.RtdsLayer"
	name?:        string
	rtds_config?: v3_1.#ConfigSource
}

#LayeredRuntime: {
	"@type": "type.googleapis.com/envoy.config.bootstrap.v3.LayeredRuntime"
	layers?: [...#RuntimeLayer]
}

#CustomInlineHeader: {
	"@type":             "type.googleapis.com/envoy.config.bootstrap.v3.CustomInlineHeader"
	inline_header_name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	inline_header_type?: #CustomInlineHeader_InlineHeaderType
}

#CustomInlineHeader_InlineHeaderType: "REQUEST_HEADER" | "REQUEST_TRAILER" | "RESPONSE_HEADER" | "RESPONSE_TRAILER"

#MemoryAllocatorManager: {
	"@type":                  "type.googleapis.com/envoy.config.bootstrap.v3.MemoryAllocatorManager"
	bytes_to_release?:        uint64
	memory_release_interval?: string
}
