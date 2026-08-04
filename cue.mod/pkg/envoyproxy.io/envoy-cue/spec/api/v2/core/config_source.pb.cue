// Code generated from envoy/api/v2/core/config_source.proto. DO NOT EDIT.
package core

#ApiConfigSource: {
	"@type":                "type.googleapis.com/envoy.api.v2.core.ApiConfigSource"
	api_type?:              #ApiConfigSource_ApiType
	transport_api_version?: #ApiVersion
	cluster_names?: [...string]
	grpc_services?: [...#GrpcService]
	refresh_delay?:                  string
	request_timeout?:                string // TODO(pgv): duration bounds
	rate_limit_settings?:            #RateLimitSettings
	set_node_on_first_message_only?: bool
}

#ApiConfigSource_ApiType: "UNSUPPORTED_REST_LEGACY" | "REST" | "GRPC" | "DELTA_GRPC"

#AggregatedConfigSource: {
	"@type": "type.googleapis.com/envoy.api.v2.core.AggregatedConfigSource"
}

#SelfConfigSource: {
	"@type":                "type.googleapis.com/envoy.api.v2.core.SelfConfigSource"
	transport_api_version?: #ApiVersion
}

#RateLimitSettings: {
	"@type":     "type.googleapis.com/envoy.api.v2.core.RateLimitSettings"
	max_tokens?: uint32
	fill_rate?:  float64 & >0
}

#ConfigSource: {
	"@type":                "type.googleapis.com/envoy.api.v2.core.ConfigSource"
	initial_fetch_timeout?: string
	resource_api_version?:  #ApiVersion

	// oneof config_source_specifier: exactly one must be set
	{path!: string} |
	{api_config_source!: #ApiConfigSource} |
	{ads!: #AggregatedConfigSource} |
	{self!: #SelfConfigSource}
}

#ApiVersion: "AUTO" | "V2" | "V3"
