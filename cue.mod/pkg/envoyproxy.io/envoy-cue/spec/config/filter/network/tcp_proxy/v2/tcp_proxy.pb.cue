// Code generated from envoy/config/filter/network/tcp_proxy/v2/tcp_proxy.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_3 "envoyproxy.io/envoy-cue/spec/type"
	v2_2 "envoyproxy.io/envoy-cue/spec/config/filter/accesslog/v2"
)

#TcpProxy: {
	"@type":                  "type.googleapis.com/envoy.config.filter.network.tcp_proxy.v2.TcpProxy"
	stat_prefix!:             string & !=""
	cluster?:                 string
	weighted_clusters?:       #TcpProxy_WeightedCluster
	metadata_match?:          core_1.#Metadata
	idle_timeout?:            string
	downstream_idle_timeout?: string
	upstream_idle_timeout?:   string
	access_log?: [...v2_2.#AccessLog]
	deprecated_v1?:        #TcpProxy_DeprecatedV1
	max_connect_attempts?: uint32 & >=1
	hash_policy?: [...type_3.#HashPolicy] & list.MaxItems(1)
	tunneling_config?: #TcpProxy_TunnelingConfig
}

#TcpProxy_DeprecatedV1: {
	"@type": "type.googleapis.com/envoy.config.filter.network.tcp_proxy.v2.TcpProxy.DeprecatedV1"
	routes!: [...#TcpProxy_DeprecatedV1_TCPRoute] & list.MinItems(1)
}

#TcpProxy_DeprecatedV1_TCPRoute: {
	"@type":  "type.googleapis.com/envoy.config.filter.network.tcp_proxy.v2.TcpProxy.DeprecatedV1.TCPRoute"
	cluster!: string & !=""
	destination_ip_list?: [...core_1.#CidrRange]
	destination_ports?: string
	source_ip_list?: [...core_1.#CidrRange]
	source_ports?: string
}

#TcpProxy_WeightedCluster: {
	"@type": "type.googleapis.com/envoy.config.filter.network.tcp_proxy.v2.TcpProxy.WeightedCluster"
	clusters!: [...#TcpProxy_WeightedCluster_ClusterWeight] & list.MinItems(1)
}

#TcpProxy_WeightedCluster_ClusterWeight: {
	"@type":         "type.googleapis.com/envoy.config.filter.network.tcp_proxy.v2.TcpProxy.WeightedCluster.ClusterWeight"
	name!:           string & !=""
	weight?:         uint32 & >=1
	metadata_match?: core_1.#Metadata
}

#TcpProxy_TunnelingConfig: {
	"@type":   "type.googleapis.com/envoy.config.filter.network.tcp_proxy.v2.TcpProxy.TunnelingConfig"
	hostname!: string & !=""
}
