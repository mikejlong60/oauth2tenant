// Code generated from envoy/config/cluster/v3/cluster.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/endpoint/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_5 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_6 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

#ClusterCollection: {
	"@type":  "type.googleapis.com/envoy.config.cluster.v3.ClusterCollection"
	entries?: v3_1.#CollectionEntry
}

#Cluster: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.Cluster"
	transport_socket_matches?: [...#Cluster_TransportSocketMatch]
	transport_socket_matcher?:          v3_2.#Matcher
	name!:                              string & strings.MinRunes(1)
	alt_stat_name?:                     string
	type?:                              #Cluster_DiscoveryType
	cluster_type?:                      #Cluster_CustomClusterType
	eds_cluster_config?:                #Cluster_EdsClusterConfig
	connect_timeout?:                   string // TODO(pgv): duration bounds
	per_connection_buffer_limit_bytes?: uint32
	lb_policy?:                         #Cluster_LbPolicy
	load_assignment?:                   v3_3.#ClusterLoadAssignment
	health_checks?: [...v3_4.#HealthCheck]
	max_requests_per_connection?:    uint32
	circuit_breakers?:               #CircuitBreakers
	upstream_http_protocol_options?: v3_4.#UpstreamHttpProtocolOptions
	common_http_protocol_options?:   v3_4.#HttpProtocolOptions
	http_protocol_options?:          v3_4.#Http1ProtocolOptions
	http2_protocol_options?:         v3_4.#Http2ProtocolOptions
	typed_extension_protocol_options?: {[string]: {...}}
	dns_refresh_rate?:         string // TODO(pgv): duration bounds
	dns_jitter?:               string // TODO(pgv): duration bounds
	dns_failure_refresh_rate?: #Cluster_RefreshRate
	respect_dns_ttl?:          bool
	dns_lookup_family?:        #Cluster_DnsLookupFamily
	dns_resolvers?: [...v3_4.#Address]
	use_tcp_for_dns_lookups?:                  bool
	dns_resolution_config?:                    v3_4.#DnsResolutionConfig
	typed_dns_resolver_config?:                v3_4.#TypedExtensionConfig
	wait_for_warm_on_init?:                    bool
	outlier_detection?:                        #OutlierDetection
	cleanup_interval?:                         string // TODO(pgv): duration bounds
	upstream_bind_config?:                     v3_4.#BindConfig
	lb_subset_config?:                         #Cluster_LbSubsetConfig
	ring_hash_lb_config?:                      #Cluster_RingHashLbConfig
	maglev_lb_config?:                         #Cluster_MaglevLbConfig
	original_dst_lb_config?:                   #Cluster_OriginalDstLbConfig
	least_request_lb_config?:                  #Cluster_LeastRequestLbConfig
	round_robin_lb_config?:                    #Cluster_RoundRobinLbConfig
	common_lb_config?:                         #Cluster_CommonLbConfig
	transport_socket?:                         v3_4.#TransportSocket
	metadata?:                                 v3_4.#Metadata
	protocol_selection?:                       #Cluster_ClusterProtocolSelection
	upstream_connection_options?:              #UpstreamConnectionOptions
	close_connections_on_host_health_failure?: bool
	ignore_health_on_host_removal?:            bool
	filters?: [...#Filter]
	load_balancing_policy?: #LoadBalancingPolicy
	lrs_server?:            v3_4.#ConfigSource
	lrs_report_endpoint_metrics?: [...string]
	track_timeout_budgets?:                     bool
	upstream_config?:                           v3_4.#TypedExtensionConfig
	track_cluster_stats?:                       #TrackClusterStats
	preconnect_policy?:                         #Cluster_PreconnectPolicy
	connection_pool_per_downstream_connection?: bool
}

#Cluster_TransportSocketMatch: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.Cluster.TransportSocketMatch"
	name!:   string & strings.MinRunes(1)
	match?: {...}
	transport_socket?: v3_4.#TransportSocket
}

#Cluster_CustomClusterType: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.Cluster.CustomClusterType"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
}

#Cluster_EdsClusterConfig: {
	"@type":       "type.googleapis.com/envoy.config.cluster.v3.Cluster.EdsClusterConfig"
	eds_config?:   v3_4.#ConfigSource
	service_name?: string
}

#Cluster_LbSubsetConfig: {
	"@type":          "type.googleapis.com/envoy.config.cluster.v3.Cluster.LbSubsetConfig"
	fallback_policy?: #Cluster_LbSubsetConfig_LbSubsetFallbackPolicy
	default_subset?: {...}
	subset_selectors?: [...#Cluster_LbSubsetConfig_LbSubsetSelector]
	locality_weight_aware?:    bool
	scale_locality_weight?:    bool
	panic_mode_any?:           bool
	list_as_any?:              bool
	metadata_fallback_policy?: #Cluster_LbSubsetConfig_LbSubsetMetadataFallbackPolicy
}

#Cluster_LbSubsetConfig_LbSubsetSelector: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.Cluster.LbSubsetConfig.LbSubsetSelector"
	keys?: [...string]
	single_host_per_subset?: bool
	fallback_policy?:        #Cluster_LbSubsetConfig_LbSubsetSelector_LbSubsetSelectorFallbackPolicy
	fallback_keys_subset?: [...string]
}

#Cluster_LbSubsetConfig_LbSubsetSelector_LbSubsetSelectorFallbackPolicy: "NOT_DEFINED" | "NO_FALLBACK" | "ANY_ENDPOINT" | "DEFAULT_SUBSET" | "KEYS_SUBSET"

#Cluster_LbSubsetConfig_LbSubsetFallbackPolicy: "NO_FALLBACK" | "ANY_ENDPOINT" | "DEFAULT_SUBSET"

#Cluster_LbSubsetConfig_LbSubsetMetadataFallbackPolicy: "METADATA_NO_FALLBACK" | "FALLBACK_LIST"

#Cluster_SlowStartConfig: {
	"@type":             "type.googleapis.com/envoy.config.cluster.v3.Cluster.SlowStartConfig"
	slow_start_window?:  string
	aggression?:         v3_4.#RuntimeDouble
	min_weight_percent?: v3_5.#Percent
}

#Cluster_RoundRobinLbConfig: {
	"@type":            "type.googleapis.com/envoy.config.cluster.v3.Cluster.RoundRobinLbConfig"
	slow_start_config?: #Cluster_SlowStartConfig
}

#Cluster_LeastRequestLbConfig: {
	"@type":              "type.googleapis.com/envoy.config.cluster.v3.Cluster.LeastRequestLbConfig"
	choice_count?:        uint32 & >=2
	active_request_bias?: v3_4.#RuntimeDouble
	slow_start_config?:   #Cluster_SlowStartConfig
}

#Cluster_RingHashLbConfig: {
	"@type":            "type.googleapis.com/envoy.config.cluster.v3.Cluster.RingHashLbConfig"
	minimum_ring_size?: uint64 & <=8388608
	hash_function?:     #Cluster_RingHashLbConfig_HashFunction
	maximum_ring_size?: uint64 & <=8388608
}

#Cluster_RingHashLbConfig_HashFunction: "XX_HASH" | "MURMUR_HASH_2"

#Cluster_MaglevLbConfig: {
	"@type":     "type.googleapis.com/envoy.config.cluster.v3.Cluster.MaglevLbConfig"
	table_size?: uint64 & <=5000011
}

#Cluster_OriginalDstLbConfig: {
	"@type":                 "type.googleapis.com/envoy.config.cluster.v3.Cluster.OriginalDstLbConfig"
	use_http_header?:        bool
	http_header_name?:       string
	upstream_port_override?: uint32 & <=65535
	metadata_key?:           v3_6.#MetadataKey
}

#Cluster_CommonLbConfig: {
	"@type":                               "type.googleapis.com/envoy.config.cluster.v3.Cluster.CommonLbConfig"
	healthy_panic_threshold?:              v3_5.#Percent
	zone_aware_lb_config?:                 #Cluster_CommonLbConfig_ZoneAwareLbConfig
	locality_weighted_lb_config?:          #Cluster_CommonLbConfig_LocalityWeightedLbConfig
	update_merge_window?:                  string
	ignore_new_hosts_until_first_hc?:      bool
	close_connections_on_host_set_change?: bool
	consistent_hashing_lb_config?:         #Cluster_CommonLbConfig_ConsistentHashingLbConfig
	override_host_status?:                 v3_4.#HealthStatusSet
}

#Cluster_CommonLbConfig_ZoneAwareLbConfig: {
	"@type":                "type.googleapis.com/envoy.config.cluster.v3.Cluster.CommonLbConfig.ZoneAwareLbConfig"
	routing_enabled?:       v3_5.#Percent
	min_cluster_size?:      uint64
	fail_traffic_on_panic?: bool
}

#Cluster_CommonLbConfig_LocalityWeightedLbConfig: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.Cluster.CommonLbConfig.LocalityWeightedLbConfig"
}

#Cluster_CommonLbConfig_ConsistentHashingLbConfig: {
	"@type":                   "type.googleapis.com/envoy.config.cluster.v3.Cluster.CommonLbConfig.ConsistentHashingLbConfig"
	use_hostname_for_hashing?: bool
	hash_balance_factor?:      uint32 & >=100
}

#Cluster_RefreshRate: {
	"@type":        "type.googleapis.com/envoy.config.cluster.v3.Cluster.RefreshRate"
	base_interval!: string // TODO(pgv): duration bounds
	max_interval?:  string // TODO(pgv): duration bounds
}

#Cluster_PreconnectPolicy: {
	"@type":                        "type.googleapis.com/envoy.config.cluster.v3.Cluster.PreconnectPolicy"
	per_upstream_preconnect_ratio?: float64 & >=1 & <=3
	predictive_preconnect_ratio?:   float64 & >=1 & <=3
}

#Cluster_DiscoveryType: "STATIC" | "STRICT_DNS" | "LOGICAL_DNS" | "EDS" | "ORIGINAL_DST"

#Cluster_LbPolicy: "ROUND_ROBIN" | "LEAST_REQUEST" | "RING_HASH" | "RANDOM" | "MAGLEV" | "CLUSTER_PROVIDED" | "LOAD_BALANCING_POLICY_CONFIG"

#Cluster_DnsLookupFamily: "AUTO" | "V4_ONLY" | "V6_ONLY" | "V4_PREFERRED" | "ALL"

#Cluster_ClusterProtocolSelection: "USE_CONFIGURED_PROTOCOL" | "USE_DOWNSTREAM_PROTOCOL"

#LoadBalancingPolicy: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.LoadBalancingPolicy"
	policies?: [...#LoadBalancingPolicy_Policy]
}

#LoadBalancingPolicy_Policy: {
	"@type":                 "type.googleapis.com/envoy.config.cluster.v3.LoadBalancingPolicy.Policy"
	typed_extension_config?: v3_4.#TypedExtensionConfig
}

#UpstreamConnectionOptions: {
	"@type":                                           "type.googleapis.com/envoy.config.cluster.v3.UpstreamConnectionOptions"
	tcp_keepalive?:                                    v3_4.#TcpKeepalive
	set_local_interface_name_on_upstream_connections?: bool
	happy_eyeballs_config?:                            #UpstreamConnectionOptions_HappyEyeballsConfig
}

#UpstreamConnectionOptions_HappyEyeballsConfig: {
	"@type":                       "type.googleapis.com/envoy.config.cluster.v3.UpstreamConnectionOptions.HappyEyeballsConfig"
	first_address_family_version?: #UpstreamConnectionOptions_FirstAddressFamilyVersion
	first_address_family_count?:   uint32 & >=1
}

#UpstreamConnectionOptions_FirstAddressFamilyVersion: "DEFAULT" | "V4" | "V6"

#TrackClusterStats: {
	"@type":                 "type.googleapis.com/envoy.config.cluster.v3.TrackClusterStats"
	timeout_budgets?:        bool
	request_response_sizes?: bool
	per_endpoint_stats?:     bool
}
