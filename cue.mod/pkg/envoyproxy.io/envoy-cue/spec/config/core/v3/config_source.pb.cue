// Code generated from envoy/config/core/v3/config_source.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

#ApiConfigSource: {
	"@type":                "type.googleapis.com/envoy.config.core.v3.ApiConfigSource"
	api_type?:              #ApiConfigSource_ApiType
	transport_api_version?: #ApiVersion
	cluster_names?: [...string]
	grpc_services?: [...#GrpcService]
	refresh_delay?:                  string
	request_timeout?:                string // TODO(pgv): duration bounds
	rate_limit_settings?:            #RateLimitSettings
	set_node_on_first_message_only?: bool
	config_validators?: [...#TypedExtensionConfig]
}

#ApiConfigSource_ApiType: "DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE" | "REST" | "GRPC" | "DELTA_GRPC" | "AGGREGATED_GRPC" | "AGGREGATED_DELTA_GRPC"

#AggregatedConfigSource: {
	"@type": "type.googleapis.com/envoy.config.core.v3.AggregatedConfigSource"
}

#SelfConfigSource: {
	"@type":                "type.googleapis.com/envoy.config.core.v3.SelfConfigSource"
	transport_api_version?: #ApiVersion
}

#RateLimitSettings: {
	"@type":     "type.googleapis.com/envoy.config.core.v3.RateLimitSettings"
	max_tokens?: uint32
	fill_rate?:  float64 & >0
}

#PathConfigSource: {
	"@type":            "type.googleapis.com/envoy.config.core.v3.PathConfigSource"
	path!:              string & strings.MinRunes(1)
	watched_directory?: #WatchedDirectory
}

#ConfigSource: {
	"@type": "type.googleapis.com/envoy.config.core.v3.ConfigSource"
	authorities?: [...v3_1.#Authority]
	initial_fetch_timeout?: string
	resource_api_version?:  #ApiVersion

	// oneof config_source_specifier: exactly one must be set
	{path!: string} |
	{path_config_source!: #PathConfigSource} |
	{api_config_source!: #ApiConfigSource} |
	{ads!: #AggregatedConfigSource} |
	{self!: #SelfConfigSource}
}

#ExtensionConfigSource: {
	"@type":        "type.googleapis.com/envoy.config.core.v3.ExtensionConfigSource"
	config_source?: #ConfigSource
	default_config?: {...}
	apply_default_config_without_warming?: bool
	type_urls!: [...string] & list.MinItems(1)
}

#ApiVersion: "AUTO" | "V2" | "V3"
