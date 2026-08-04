// Code generated from envoy/extensions/filters/network/dubbo_proxy/v3/route.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/route/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#RouteConfiguration: {
	"@type":    "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.RouteConfiguration"
	name?:      string
	interface?: string
	group?:     string
	version?:   string
	routes?: [...#Route]
}

#Route: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.Route"
	match!:  #RouteMatch
	route!:  #RouteAction
}

#RouteMatch: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.RouteMatch"
	method?: #MethodMatch
	headers?: [...v3_1.#HeaderMatcher]
}

#RouteAction: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.RouteAction"
	metadata_match?: v3_2.#Metadata

	// oneof cluster_specifier: exactly one must be set
	{cluster!: string} |
	{weighted_clusters!: v3_1.#WeightedCluster}
}

#MethodMatch: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.MethodMatch"
	name?:   v3_3.#StringMatcher
	params_match?: {[string]: #MethodMatch_ParameterMatchSpecifier}
}

#MethodMatch_ParameterMatchSpecifier: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.MethodMatch.ParameterMatchSpecifier"

	// oneof parameter_match_specifier: at most one may be set
	*{} |
	{exact_match!: string} |
	{range_match!: v3_4.#Int64Range}
}

#MultipleRouteConfiguration: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.MultipleRouteConfiguration"
	name?:   string
	route_config?: [...#RouteConfiguration]
}
