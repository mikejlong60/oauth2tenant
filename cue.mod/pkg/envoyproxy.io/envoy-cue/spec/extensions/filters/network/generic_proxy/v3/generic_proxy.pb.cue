// Code generated from envoy/extensions/filters/network/generic_proxy/v3/generic_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/http_connection_manager/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
)

#GenericProxy: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.v3.GenericProxy"
	stat_prefix!:  string & strings.MinRunes(1)
	codec_config!: v3_1.#TypedExtensionConfig
	filters?: [...v3_1.#TypedExtensionConfig]
	tracing?: v3_2.#HttpConnectionManager_Tracing
	access_log?: [...v3_3.#AccessLog]

	// oneof route_specifier: exactly one must be set
	{generic_rds!: #GenericRds} |
	{route_config!: #RouteConfiguration}
}

#GenericRds: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.v3.GenericRds"
	config_source!:     v3_1.#ConfigSource
	route_config_name!: string & strings.MinRunes(1)
}
