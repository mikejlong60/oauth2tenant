// Code generated from envoy/extensions/filters/http/ext_proc/v3/ext_proc.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/common/mutation_rules/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#ExternalProcessor: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.ExternalProcessor"
	grpc_service?:       v3_1.#GrpcService
	http_service?:       #ExtProcHttpService
	failure_mode_allow?: bool
	processing_mode?:    #ProcessingMode
	request_attributes?: [...string]
	response_attributes?: [...string]
	message_timeout?:     string // TODO(pgv): duration bounds
	stat_prefix?:         string
	mutation_rules?:      v3_2.#HeaderMutationRules
	max_message_timeout?: string // TODO(pgv): duration bounds
	forward_rules?:       #HeaderForwardingRules
	filter_metadata?: {...}
	allow_mode_override?:                           bool
	disable_immediate_response?:                    bool
	metadata_options?:                              #MetadataOptions
	observability_mode?:                            bool
	disable_clear_route_cache?:                     bool
	route_cache_action?:                            #ExternalProcessor_RouteCacheAction
	deferred_close_timeout?:                        string
	send_body_without_waiting_for_header_response?: bool
	allowed_override_modes?: [...#ProcessingMode]
	processing_request_modifier?: v3_1.#TypedExtensionConfig
	on_processing_response?:      v3_1.#TypedExtensionConfig
	status_on_error?:             v3_3.#HttpStatus
}

#ExternalProcessor_RouteCacheAction: "DEFAULT" | "CLEAR" | "RETAIN"

#ExtProcHttpService: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.ExtProcHttpService"
	http_service?: v3_1.#HttpService
}

#MetadataOptions: {
	"@type":                                 "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.MetadataOptions"
	forwarding_namespaces?:                  #MetadataOptions_MetadataNamespaces
	receiving_namespaces?:                   #MetadataOptions_MetadataNamespaces
	cluster_metadata_forwarding_namespaces?: #MetadataOptions_MetadataNamespaces
}

#MetadataOptions_MetadataNamespaces: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.MetadataOptions.MetadataNamespaces"
	untyped?: [...string]
	typed?: [...string]
}

#HeaderForwardingRules: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.HeaderForwardingRules"
	allowed_headers?:    v3_4.#ListStringMatcher
	disallowed_headers?: v3_4.#ListStringMatcher
}

#ExtProcPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.ExtProcPerRoute"

	// oneof override: exactly one must be set
	{disabled!: bool & true} |
	{overrides!: #ExtProcOverrides}
}

#ExtProcOverrides: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.ExtProcOverrides"
	processing_mode?: #ProcessingMode
	async_mode?:      bool
	request_attributes?: [...string]
	response_attributes?: [...string]
	grpc_service?:     v3_1.#GrpcService
	metadata_options?: #MetadataOptions
	grpc_initial_metadata?: [...v3_1.#HeaderValue]
	failure_mode_allow?:          bool
	processing_request_modifier?: v3_1.#TypedExtensionConfig
}
