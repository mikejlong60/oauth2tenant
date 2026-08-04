// Code generated from envoy/extensions/filters/network/generic_proxy/action/v3/action.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#RouteAction: {
	"@type":   "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.action.v3.RouteAction"
	name?:     string
	metadata?: v3_1.#Metadata
	per_filter_config?: {[string]: {...}}
	timeout?:      string
	retry_policy?: v3_1.#RetryPolicy

	// oneof cluster_specifier: exactly one must be set
	{cluster!: string} |
	{weighted_clusters!: v3_2.#WeightedCluster}
}
