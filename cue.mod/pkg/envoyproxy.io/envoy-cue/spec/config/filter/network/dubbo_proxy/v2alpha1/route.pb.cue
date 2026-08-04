// Code generated from envoy/config/filter/network/dubbo_proxy/v2alpha1/route.proto. DO NOT EDIT.
package v2alpha1

import (
	matcher_2 "envoyproxy.io/envoy-cue/spec/type/matcher"
	route_1 "envoyproxy.io/envoy-cue/spec/api/v2/route"
	type_3 "envoyproxy.io/envoy-cue/spec/type"
)

// [#next-free-field: 6]
#RouteConfiguration: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.RouteConfiguration"

	// The name of the route configuration. Reserved for future use in asynchronous route discovery.
	name?: string

	// The interface name of the service.
	interface?: string

	// Which group does the interface belong to.
	group?: string

	// The version number of the interface.
	version?: string

	// The list of routes that will be matched, in order, against incoming requests. The first route
	// that matches will be used.
	routes?: [...#Route]
}

#Route: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.Route"

	// Route matching parameters.
	match!: #RouteMatch

	// Route request to some upstream cluster.
	route!: #RouteAction
}

#RouteMatch: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.RouteMatch"

	// Method level routing matching.
	method?: #MethodMatch

	// Specifies a set of headers that the route should match on. The router will check the request’s
	// headers against all the specified headers in the route config. A match will happen if all the
	// headers in the route are present in the request with the same values (or based on presence if
	// the value field is not in the config).
	headers?: [...route_1.#HeaderMatcher]
}

#RouteAction: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.RouteAction"

	// oneof cluster_specifier: exactly one must be set
	// Indicates the upstream cluster to which the request should be routed.
	{cluster!: string} |
	{

		// Multiple upstream clusters can be specified for a given route. The
		// request is routed to one of the upstream clusters based on weights
		// assigned to each cluster.
		// Currently ClusterWeight only supports the name and weight fields.
		weighted_clusters!: route_1.#WeightedCluster
	}
}

#MethodMatch: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.MethodMatch"

	// The name of the method.
	name?: matcher_2.#StringMatcher

	// Method parameter definition.
	// The key is the parameter index, starting from 0.
	// The value is the parameter matching type.
	params_match?: {[string]: #MethodMatch_ParameterMatchSpecifier}
}

// The parameter matching type.
#MethodMatch_ParameterMatchSpecifier: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.MethodMatch.ParameterMatchSpecifier"

	// oneof parameter_match_specifier: at most one may be set
	*{} |
	{

		// If specified, header match will be performed based on the value of the header.
		exact_match!: string
	} |
	{

		// If specified, header match will be performed based on range.
		// The rule will match if the request header value is within this range.
		// The entire request header value must represent an integer in base 10 notation: consisting
		// of an optional plus or minus sign followed by a sequence of digits. The rule will not match
		// if the header value does not represent an integer. Match will fail for empty values,
		// floating point numbers or if only a subsequence of the header value is an integer.
		//
		// Examples:
		//
		// * For range [-10,0), route will match for header value -1, but not for 0,
		//   "somestring", 10.9, "-1somestring"
		range_match!: type_3.#Int64Range
	}
}
