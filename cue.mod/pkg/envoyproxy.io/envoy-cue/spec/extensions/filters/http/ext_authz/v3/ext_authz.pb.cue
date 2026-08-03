// Code generated from envoy/extensions/filters/http/ext_authz/v3/ext_authz.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/common/mutation_rules/v3"
)

#ExtAuthz: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.ExtAuthz"
	grpc_service?:                  v3_1.#GrpcService
	http_service?:                  #HttpService
	transport_api_version?:         v3_1.#ApiVersion
	failure_mode_allow?:            bool
	failure_mode_allow_header_add?: bool
	with_request_body?:             #BufferSettings
	clear_route_cache?:             bool
	status_on_error?:               v3_2.#HttpStatus
	validate_mutations?:            bool
	metadata_context_namespaces?: [...string]
	typed_metadata_context_namespaces?: [...string]
	route_metadata_context_namespaces?: [...string]
	route_typed_metadata_context_namespaces?: [...string]
	filter_enabled?:                    v3_1.#RuntimeFractionalPercent
	filter_enabled_metadata?:           v3_3.#MetadataMatcher
	deny_at_disable?:                   v3_1.#RuntimeFeatureFlag
	include_peer_certificate?:          bool
	stat_prefix?:                       string
	bootstrap_metadata_labels_key?:     string
	allowed_headers?:                   v3_3.#ListStringMatcher
	disallowed_headers?:                v3_3.#ListStringMatcher
	include_tls_session?:               bool
	charge_cluster_response_stats?:     bool
	encode_raw_headers?:                bool
	decoder_header_mutation_rules?:     v3_4.#HeaderMutationRules
	enable_dynamic_metadata_ingestion?: bool
	filter_metadata?: {...}
	emit_filter_state_stats?:        bool
	max_denied_response_body_bytes?: uint32
	enforce_response_header_limits?: bool
}

#BufferSettings: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.BufferSettings"
	max_request_bytes?:     uint32 & >0
	allow_partial_message?: bool
	pack_as_bytes?:         bool
}

#HttpService: {
	"@type":                 "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.HttpService"
	server_uri?:             v3_1.#HttpUri
	path_prefix?:            string
	authorization_request?:  #AuthorizationRequest
	authorization_response?: #AuthorizationResponse
	retry_policy?:           v3_1.#RetryPolicy
}

#AuthorizationRequest: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.AuthorizationRequest"
	allowed_headers?: v3_3.#ListStringMatcher
	headers_to_add?: [...v3_1.#HeaderValue]
}

#AuthorizationResponse: {
	"@type":                             "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.AuthorizationResponse"
	allowed_upstream_headers?:           v3_3.#ListStringMatcher
	allowed_upstream_headers_to_append?: v3_3.#ListStringMatcher
	allowed_client_headers?:             v3_3.#ListStringMatcher
	allowed_client_headers_on_success?:  v3_3.#ListStringMatcher
	dynamic_metadata_from_headers?:      v3_3.#ListStringMatcher
}

#ExtAuthzPerRoute: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.ExtAuthzPerRoute"
	disabled?:       bool
	check_settings!: #CheckSettings
}

#CheckSettings: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.CheckSettings"
	context_extensions?: {[string]: string}
	disable_request_body_buffering?: bool
	with_request_body?:              #BufferSettings
	grpc_service?:                   v3_1.#GrpcService
	http_service?:                   #HttpService
}
