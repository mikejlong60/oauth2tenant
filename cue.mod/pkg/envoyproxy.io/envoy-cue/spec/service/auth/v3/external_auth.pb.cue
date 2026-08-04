// Code generated from envoy/service/auth/v3/external_auth.proto. DO NOT EDIT.
package v3

import (
	status_3 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#CheckRequest: {
	"@type":     "type.googleapis.com/envoy.service.auth.v3.CheckRequest"
	attributes?: #AttributeContext
}

#DeniedHttpResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v3.DeniedHttpResponse"
	status?: v3_1.#HttpStatus
	headers?: [...v3_2.#HeaderValueOption]
	body?: string
}

#OkHttpResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v3.OkHttpResponse"
	headers?: [...v3_2.#HeaderValueOption]
	headers_to_remove?: [...string]
	dynamic_metadata?: {...}
	response_headers_to_add?: [...v3_2.#HeaderValueOption]
	query_parameters_to_set?: [...v3_2.#QueryParameter]
	query_parameters_to_remove?: [...string]
}

#CheckResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v3.CheckResponse"
	status?: status_3.#Status
	dynamic_metadata?: {...}

	// oneof http_response: at most one may be set
	*{} |
	{denied_response!: #DeniedHttpResponse} |
	{ok_response!: #OkHttpResponse} |
	{error_response!: #DeniedHttpResponse}
}
