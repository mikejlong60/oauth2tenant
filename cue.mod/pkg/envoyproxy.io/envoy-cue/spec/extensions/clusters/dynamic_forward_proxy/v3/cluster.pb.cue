// Code generated from envoy/extensions/clusters/dynamic_forward_proxy/v3/cluster.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/dynamic_forward_proxy/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ClusterConfig: {
	"@type":                         "type.googleapis.com/envoy.extensions.clusters.dynamic_forward_proxy.v3.ClusterConfig"
	dns_cache_config?:               v3_1.#DnsCacheConfig
	sub_clusters_config?:            #SubClustersConfig
	allow_insecure_cluster_options?: bool
	allow_coalesced_connections?:    bool
}

#SubClustersConfig: {
	"@type":           "type.googleapis.com/envoy.extensions.clusters.dynamic_forward_proxy.v3.SubClustersConfig"
	lb_policy?:        v3_2.#Cluster_LbPolicy
	max_sub_clusters?: uint32 & >0
	sub_cluster_ttl?:  string // TODO(pgv): duration bounds
	preresolve_clusters?: [...v3_3.#SocketAddress]
}
