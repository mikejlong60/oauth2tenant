// Code generated from envoy/service/auth/v2/external_auth.proto. DO NOT EDIT.
package v2

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	status_3 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#CheckRequest: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.CheckRequest"

	// The request attributes.
	attributes?: #AttributeContext
}

// HTTP attributes for a denied response.
#DeniedHttpResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.DeniedHttpResponse"

	// This field allows the authorization service to send a HTTP response status
	// code to the downstream client other than 403 (Forbidden).
	status!: type_1.#HttpStatus

	// This field allows the authorization service to send HTTP response headers
	// to the downstream client. Note that the `append` field in `HeaderValueOption` defaults to
	// false when used in this message.
	headers?: [...core_2.#HeaderValueOption]

	// This field allows the authorization service to send a response body data
	// to the downstream client.
	body?: string
}

// HTTP attributes for an ok response.
#OkHttpResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.OkHttpResponse"

	// HTTP entity headers in addition to the original request headers. This allows the authorization
	// service to append, to add or to override headers from the original request before
	// dispatching it to the upstream. Note that the `append` field in `HeaderValueOption` defaults to
	// false when used in this message. By setting the `append` field to `true`,
	// the filter will append the correspondent header value to the matched request header.
	// By leaving `append` as false, the filter will either add a new header, or override an existing
	// one if there is a match.
	headers?: [...core_2.#HeaderValueOption]
}

// Intended for gRPC and Network Authorization servers `only`.
#CheckResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.CheckResponse"

	// Status `OK` allows the request. Any other status indicates the request should be denied.
	status?: status_3.#Status

	// An message that contains HTTP response attributes. This message is
	// used when the authorization service needs to send custom responses to the
	// downstream client or, to modify/add request headers being dispatched to the upstream.
	// oneof http_response: at most one may be set
	*{} |
	{

		// Supplies http attributes for a denied response.
		denied_response!: #DeniedHttpResponse
	} |
	{

		// Supplies http attributes for an ok response.
		ok_response!: #OkHttpResponse
	}
}
