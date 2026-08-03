// Code generated from envoy/config/filter/network/dubbo_proxy/v2alpha1/route.proto. DO NOT EDIT.
package v2alpha1

import (
	matcher_2 "envoyproxy.io/envoy-cue/spec/type/matcher"
	route_1 "envoyproxy.io/envoy-cue/spec/api/v2/route"
	type_3 "envoyproxy.io/envoy-cue/spec/type"
)

#RouteConfiguration: {
	"@type":    "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.RouteConfiguration"
	name?:      string
	interface?: string
	group?:     string
	version?:   string
	routes?: [...#Route]
}

#Route: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.Route"
	match!:  #RouteMatch
	route!:  #RouteAction
}

#RouteMatch: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.RouteMatch"
	method?: #MethodMatch
	headers?: [...route_1.#HeaderMatcher]
}

#RouteAction: {
	"@type":            "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.RouteAction"
	cluster?:           string
	weighted_clusters?: route_1.#WeightedCluster
}

#MethodMatch: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.MethodMatch"
	name?:   matcher_2.#StringMatcher
	params_match?: {[string]: #MethodMatch_ParameterMatchSpecifier}
}

#MethodMatch_ParameterMatchSpecifier: {
	"@type":      "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.MethodMatch.ParameterMatchSpecifier"
	exact_match?: string
	range_match?: type_3.#Int64Range
}
