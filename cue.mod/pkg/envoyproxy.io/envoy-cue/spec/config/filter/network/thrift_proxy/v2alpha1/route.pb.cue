// Code generated from envoy/config/filter/network/thrift_proxy/v2alpha1/route.proto. DO NOT EDIT.
package v2alpha1

import (
	"list"
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	route_1 "envoyproxy.io/envoy-cue/spec/api/v2/route"
)

#RouteConfiguration: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.RouteConfiguration"
	name?:   string
	routes?: [...#Route]
}

#Route: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.Route"
	match!:  #RouteMatch
	route!:  #RouteAction
}

#RouteMatch: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.RouteMatch"
	invert?: bool
	headers?: [...route_1.#HeaderMatcher]

	// oneof match_specifier: exactly one must be set
	{method_name!: string} |
	{service_name!: string}
}

#RouteAction: {
	"@type":         "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.RouteAction"
	metadata_match?: core_2.#Metadata
	rate_limits?: [...route_1.#RateLimit]
	strip_service_name?: bool

	// oneof cluster_specifier: exactly one must be set
	{cluster!: string & !=""} |
	{weighted_clusters!: #WeightedCluster} |
	{cluster_header!: string & !=""}
}

#WeightedCluster: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.WeightedCluster"
	clusters!: [...#WeightedCluster_ClusterWeight] & list.MinItems(1)
}

#WeightedCluster_ClusterWeight: {
	"@type":         "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.WeightedCluster.ClusterWeight"
	name!:           string & !=""
	weight?:         uint32 & >=1
	metadata_match?: core_2.#Metadata
}
