// Code generated from envoy/extensions/filters/network/thrift_proxy/v3/route.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/route/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#RouteConfiguration: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.RouteConfiguration"
	name?:   string
	routes?: [...#Route]
	validate_clusters?: bool
}

#Route: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.Route"
	match!:  #RouteMatch
	route!:  #RouteAction
}

#RouteMatch: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.RouteMatch"
	invert?: bool
	headers?: [...v3_1.#HeaderMatcher]

	// oneof match_specifier: exactly one must be set
	{method_name!: string} |
	{service_name!: string}
}

#RouteAction: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.RouteAction"
	metadata_match?: v3_2.#Metadata
	rate_limits?: [...v3_1.#RateLimit]
	strip_service_name?: bool
	request_mirror_policies?: [...#RouteAction_RequestMirrorPolicy]

	// oneof cluster_specifier: exactly one must be set
	// TODO(pgv): cluster_header.string well-known *validate.StringRules_WellKnownRegex
	{cluster!: string & strings.MinRunes(1)} |
	{weighted_clusters!: #WeightedCluster} |
	{cluster_header!: string & strings.MinRunes(1)}
}

#RouteAction_RequestMirrorPolicy: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.RouteAction.RequestMirrorPolicy"
	cluster!:          string & strings.MinRunes(1)
	runtime_fraction?: v3_2.#RuntimeFractionalPercent
}

#WeightedCluster: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.WeightedCluster"
	clusters!: [...#WeightedCluster_ClusterWeight] & list.MinItems(1)
}

#WeightedCluster_ClusterWeight: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.WeightedCluster.ClusterWeight"
	name!:           string & strings.MinRunes(1)
	weight?:         uint32 & >=1
	metadata_match?: v3_2.#Metadata
}
