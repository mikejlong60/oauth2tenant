// Code generated from envoy/extensions/filters/network/tcp_proxy/v3/tcp_proxy.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/http_connection_manager/v3"
)

#TcpProxy: {
	"@type":                  "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy"
	stat_prefix!:             string & strings.MinRunes(1)
	on_demand?:               #TcpProxy_OnDemand
	metadata_match?:          v3_1.#Metadata
	idle_timeout?:            string
	downstream_idle_timeout?: string
	upstream_idle_timeout?:   string
	access_log?: [...v3_2.#AccessLog]
	max_connect_attempts?: uint32 & >=1
	backoff_options?:      v3_1.#BackoffStrategy
	hash_policy?: [...v3_3.#HashPolicy] & list.MaxItems(1)
	tunneling_config?:                                     #TcpProxy_TunnelingConfig
	max_downstream_connection_duration?:                   string // TODO(pgv): duration bounds
	max_downstream_connection_duration_jitter_percentage?: v3_3.#Percent
	access_log_flush_interval?:                            string // TODO(pgv): duration bounds
	flush_access_log_on_connected?:                        bool
	access_log_options?:                                   #TcpProxy_TcpAccessLogOptions
	proxy_protocol_tlvs?: [...v3_1.#TlvEntry]
	upstream_connect_mode?: #UpstreamConnectMode
	max_early_data_bytes?:  uint32 & <=1048576

	// oneof cluster_specifier: exactly one must be set
	{cluster!: string} |
	{weighted_clusters!: #TcpProxy_WeightedCluster}
}

#TcpProxy_WeightedCluster: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.WeightedCluster"
	clusters!: [...#TcpProxy_WeightedCluster_ClusterWeight] & list.MinItems(1)
}

#TcpProxy_WeightedCluster_ClusterWeight: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.WeightedCluster.ClusterWeight"
	name!:           string & strings.MinRunes(1)
	weight?:         uint32 & >=1
	metadata_match?: v3_1.#Metadata
}

#TcpProxy_TunnelingConfig: {
	"@type":   "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.TunnelingConfig"
	hostname!: string & strings.MinRunes(1)
	use_post?: bool
	headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)
	propagate_response_headers?:  bool
	post_path?:                   string
	propagate_response_trailers?: bool
	request_id_extension?:        v3_4.#RequestIDExtension
	request_id_header?:           string
	request_id_metadata_key?:     string
}

#TcpProxy_OnDemand: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.OnDemand"
	odcds_config?:      v3_1.#ConfigSource
	resources_locator?: string
	timeout?:           string
}

#TcpProxy_TcpAccessLogOptions: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.TcpAccessLogOptions"
	access_log_flush_interval?:     string // TODO(pgv): duration bounds
	flush_access_log_on_connected?: bool
	flush_access_log_on_start?:     bool
}

#UpstreamConnectMode: "IMMEDIATE" | "ON_DOWNSTREAM_DATA" | "ON_DOWNSTREAM_TLS_HANDSHAKE"
