// Code generated from envoy/extensions/filters/network/generic_proxy/v3/generic_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/http_connection_manager/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
)

// [#next-free-field: 8]
#GenericProxy: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.v3.GenericProxy"

	// The human readable prefix to use when emitting statistics.
	stat_prefix!: string & strings.MinRunes(1)

	// The codec which encodes and decodes the application protocol.
	// [#extension-category: envoy.generic_proxy.codecs]
	codec_config!: v3_1.#TypedExtensionConfig

	// A list of individual Layer-7 filters that make up the filter chain for requests made to the
	// proxy. Order matters as the filters are processed sequentially as request events
	// happen.
	// [#extension-category: envoy.generic_proxy.filters]
	filters?: [...v3_1.#TypedExtensionConfig]

	// Tracing configuration for the generic proxy.
	tracing?: v3_2.#HttpConnectionManager_Tracing

	// Configuration for :ref:`access logs <arch_overview_access_logs>` emitted by generic proxy.
	access_log?: [...v3_3.#AccessLog]

	// oneof route_specifier: exactly one must be set
	// The generic proxies route table will be dynamically loaded via the meta RDS API.
	{generic_rds!: #GenericRds} |
	{

		// The route table for the generic proxy is static and is specified in this property.
		route_config!: #RouteConfiguration
	}
}

#GenericRds: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.v3.GenericRds"

	// Configuration source specifier for RDS.
	config_source!: v3_1.#ConfigSource

	// The name of the route configuration. This name will be passed to the RDS API. This allows an
	// Envoy configuration with multiple generic proxies to use different route configurations.
	route_config_name!: string & strings.MinRunes(1)
}
