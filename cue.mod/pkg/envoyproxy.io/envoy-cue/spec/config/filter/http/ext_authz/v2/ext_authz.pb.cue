// Code generated from envoy/config/filter/http/ext_authz/v2/ext_authz.proto. DO NOT EDIT.
package v2

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_3 "envoyproxy.io/envoy-cue/spec/type/matcher"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#ExtAuthz: {
	"@type":             "type.googleapis.com/envoy.config.filter.http.ext_authz.v2.ExtAuthz"
	failure_mode_allow?: bool
	use_alpha?:          bool
	with_request_body?:  #BufferSettings
	clear_route_cache?:  bool
	status_on_error?:    type_1.#HttpStatus
	metadata_context_namespaces?: [...string]
	filter_enabled?:           core_2.#RuntimeFractionalPercent
	deny_at_disable?:          core_2.#RuntimeFeatureFlag
	include_peer_certificate?: bool

	// oneof services: at most one may be set
	*{} |
	{grpc_service!: core_2.#GrpcService} |
	{http_service!: #HttpService}
}

#BufferSettings: {
	"@type":                "type.googleapis.com/envoy.config.filter.http.ext_authz.v2.BufferSettings"
	max_request_bytes?:     uint32 & >0
	allow_partial_message?: bool
}

#HttpService: {
	"@type":                 "type.googleapis.com/envoy.config.filter.http.ext_authz.v2.HttpService"
	server_uri?:             core_2.#HttpUri
	path_prefix?:            string
	authorization_request?:  #AuthorizationRequest
	authorization_response?: #AuthorizationResponse
}

#AuthorizationRequest: {
	"@type":          "type.googleapis.com/envoy.config.filter.http.ext_authz.v2.AuthorizationRequest"
	allowed_headers?: matcher_3.#ListStringMatcher
	headers_to_add?: [...core_2.#HeaderValue]
}

#AuthorizationResponse: {
	"@type":                   "type.googleapis.com/envoy.config.filter.http.ext_authz.v2.AuthorizationResponse"
	allowed_upstream_headers?: matcher_3.#ListStringMatcher
	allowed_client_headers?:   matcher_3.#ListStringMatcher
}

#ExtAuthzPerRoute: {
	"@type": "type.googleapis.com/envoy.config.filter.http.ext_authz.v2.ExtAuthzPerRoute"

	// oneof override: exactly one must be set
	{disabled!: bool & true} |
	{check_settings!: #CheckSettings}
}

#CheckSettings: {
	"@type": "type.googleapis.com/envoy.config.filter.http.ext_authz.v2.CheckSettings"
	context_extensions?: {[string]: string}
}
