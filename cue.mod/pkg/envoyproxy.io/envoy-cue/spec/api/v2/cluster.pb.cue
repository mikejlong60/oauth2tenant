// Code generated from envoy/api/v2/cluster.proto. DO NOT EDIT.
package v2

import (
	"strings"
	auth_3 "envoyproxy.io/envoy-cue/spec/api/v2/auth"
	cluster_2 "envoyproxy.io/envoy-cue/spec/api/v2/cluster"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_4 "envoyproxy.io/envoy-cue/spec/type"
)

#Cluster: {
	"@type": "type.googleapis.com/envoy.api.v2.Cluster"
	transport_socket_matches?: [...#Cluster_TransportSocketMatch]
	name!:                              string & !=""
	alt_stat_name?:                     string
	type?:                              #Cluster_DiscoveryType
	cluster_type?:                      #Cluster_CustomClusterType
	eds_cluster_config?:                #Cluster_EdsClusterConfig
	connect_timeout?:                   string // TODO(pgv): duration bounds
	per_connection_buffer_limit_bytes?: uint32
	lb_policy?:                         #Cluster_LbPolicy
	hosts?: [...core_1.#Address]
	load_assignment?: #ClusterLoadAssignment
	health_checks?: [...core_1.#HealthCheck]
	max_requests_per_connection?:    uint32
	circuit_breakers?:               cluster_2.#CircuitBreakers
	tls_context?:                    auth_3.#UpstreamTlsContext
	upstream_http_protocol_options?: core_1.#UpstreamHttpProtocolOptions
	common_http_protocol_options?:   core_1.#HttpProtocolOptions
	http_protocol_options?:          core_1.#Http1ProtocolOptions
	http2_protocol_options?:         core_1.#Http2ProtocolOptions
	extension_protocol_options?: {[string]: {...}}
	typed_extension_protocol_options?: {[string]: {...}}
	dns_refresh_rate?:         string // TODO(pgv): duration bounds
	dns_failure_refresh_rate?: #Cluster_RefreshRate
	respect_dns_ttl?:          bool
	dns_lookup_family?:        #Cluster_DnsLookupFamily
	dns_resolvers?: [...core_1.#Address]
	use_tcp_for_dns_lookups?:                  bool
	outlier_detection?:                        cluster_2.#OutlierDetection
	cleanup_interval?:                         string // TODO(pgv): duration bounds
	upstream_bind_config?:                     core_1.#BindConfig
	lb_subset_config?:                         #Cluster_LbSubsetConfig
	ring_hash_lb_config?:                      #Cluster_RingHashLbConfig
	original_dst_lb_config?:                   #Cluster_OriginalDstLbConfig
	least_request_lb_config?:                  #Cluster_LeastRequestLbConfig
	common_lb_config?:                         #Cluster_CommonLbConfig
	transport_socket?:                         core_1.#TransportSocket
	metadata?:                                 core_1.#Metadata
	protocol_selection?:                       #Cluster_ClusterProtocolSelection
	upstream_connection_options?:              #UpstreamConnectionOptions
	close_connections_on_host_health_failure?: bool
	drain_connections_on_host_removal?:        bool
	filters?: [...cluster_2.#Filter]
	load_balancing_policy?: #LoadBalancingPolicy
	lrs_server?:            core_1.#ConfigSource
	track_timeout_budgets?: bool
}

#Cluster_TransportSocketMatch: {
	"@type": "type.googleapis.com/envoy.api.v2.Cluster.TransportSocketMatch"
	name!:   string & strings.MinRunes(1)
	match?: {...}
	transport_socket?: core_1.#TransportSocket
}

#Cluster_CustomClusterType: {
	"@type": "type.googleapis.com/envoy.api.v2.Cluster.CustomClusterType"
	name!:   string & !=""
	typed_config?: {...}
}

#Cluster_EdsClusterConfig: {
	"@type":       "type.googleapis.com/envoy.api.v2.Cluster.EdsClusterConfig"
	eds_config?:   core_1.#ConfigSource
	service_name?: string
}

#Cluster_LbSubsetConfig: {
	"@type":          "type.googleapis.com/envoy.api.v2.Cluster.LbSubsetConfig"
	fallback_policy?: #Cluster_LbSubsetConfig_LbSubsetFallbackPolicy
	default_subset?: {...}
	subset_selectors?: [...#Cluster_LbSubsetConfig_LbSubsetSelector]
	locality_weight_aware?: bool
	scale_locality_weight?: bool
	panic_mode_any?:        bool
	list_as_any?:           bool
}

#Cluster_LbSubsetConfig_LbSubsetSelector: {
	"@type": "type.googleapis.com/envoy.api.v2.Cluster.LbSubsetConfig.LbSubsetSelector"
	keys?: [...string]
	fallback_policy?: #Cluster_LbSubsetConfig_LbSubsetSelector_LbSubsetSelectorFallbackPolicy
	fallback_keys_subset?: [...string]
}

#Cluster_LbSubsetConfig_LbSubsetSelector_LbSubsetSelectorFallbackPolicy: "NOT_DEFINED" | "NO_FALLBACK" | "ANY_ENDPOINT" | "DEFAULT_SUBSET" | "KEYS_SUBSET"

#Cluster_LbSubsetConfig_LbSubsetFallbackPolicy: "NO_FALLBACK" | "ANY_ENDPOINT" | "DEFAULT_SUBSET"

#Cluster_LeastRequestLbConfig: {
	"@type":       "type.googleapis.com/envoy.api.v2.Cluster.LeastRequestLbConfig"
	choice_count?: uint32 & >=2
}

#Cluster_RingHashLbConfig: {
	"@type":            "type.googleapis.com/envoy.api.v2.Cluster.RingHashLbConfig"
	minimum_ring_size?: uint64 & <=8388608
	hash_function?:     #Cluster_RingHashLbConfig_HashFunction
	maximum_ring_size?: uint64 & <=8388608
}

#Cluster_RingHashLbConfig_HashFunction: "XX_HASH" | "MURMUR_HASH_2"

#Cluster_OriginalDstLbConfig: {
	"@type":          "type.googleapis.com/envoy.api.v2.Cluster.OriginalDstLbConfig"
	use_http_header?: bool
}

#Cluster_CommonLbConfig: {
	"@type":                               "type.googleapis.com/envoy.api.v2.Cluster.CommonLbConfig"
	healthy_panic_threshold?:              type_4.#Percent
	zone_aware_lb_config?:                 #Cluster_CommonLbConfig_ZoneAwareLbConfig
	locality_weighted_lb_config?:          #Cluster_CommonLbConfig_LocalityWeightedLbConfig
	update_merge_window?:                  string
	ignore_new_hosts_until_first_hc?:      bool
	close_connections_on_host_set_change?: bool
	consistent_hashing_lb_config?:         #Cluster_CommonLbConfig_ConsistentHashingLbConfig
}

#Cluster_CommonLbConfig_ZoneAwareLbConfig: {
	"@type":                "type.googleapis.com/envoy.api.v2.Cluster.CommonLbConfig.ZoneAwareLbConfig"
	routing_enabled?:       type_4.#Percent
	min_cluster_size?:      uint64
	fail_traffic_on_panic?: bool
}

#Cluster_CommonLbConfig_LocalityWeightedLbConfig: {
	"@type": "type.googleapis.com/envoy.api.v2.Cluster.CommonLbConfig.LocalityWeightedLbConfig"
}

#Cluster_CommonLbConfig_ConsistentHashingLbConfig: {
	"@type":                   "type.googleapis.com/envoy.api.v2.Cluster.CommonLbConfig.ConsistentHashingLbConfig"
	use_hostname_for_hashing?: bool
}

#Cluster_RefreshRate: {
	"@type":        "type.googleapis.com/envoy.api.v2.Cluster.RefreshRate"
	base_interval!: string // TODO(pgv): duration bounds
	max_interval?:  string // TODO(pgv): duration bounds
}

#Cluster_DiscoveryType: "STATIC" | "STRICT_DNS" | "LOGICAL_DNS" | "EDS" | "ORIGINAL_DST"

#Cluster_LbPolicy: "ROUND_ROBIN" | "LEAST_REQUEST" | "RING_HASH" | "RANDOM" | "ORIGINAL_DST_LB" | "MAGLEV" | "CLUSTER_PROVIDED" | "LOAD_BALANCING_POLICY_CONFIG"

#Cluster_DnsLookupFamily: "AUTO" | "V4_ONLY" | "V6_ONLY"

#Cluster_ClusterProtocolSelection: "USE_CONFIGURED_PROTOCOL" | "USE_DOWNSTREAM_PROTOCOL"

#LoadBalancingPolicy: {
	"@type": "type.googleapis.com/envoy.api.v2.LoadBalancingPolicy"
	policies?: [...#LoadBalancingPolicy_Policy]
}

#LoadBalancingPolicy_Policy: {
	"@type": "type.googleapis.com/envoy.api.v2.LoadBalancingPolicy.Policy"
	name?:   string
	config?: {...}
	typed_config?: {...}
}

#UpstreamBindConfig: {
	"@type":         "type.googleapis.com/envoy.api.v2.UpstreamBindConfig"
	source_address?: core_1.#Address
}

#UpstreamConnectionOptions: {
	"@type":        "type.googleapis.com/envoy.api.v2.UpstreamConnectionOptions"
	tcp_keepalive?: core_1.#TcpKeepalive
}
