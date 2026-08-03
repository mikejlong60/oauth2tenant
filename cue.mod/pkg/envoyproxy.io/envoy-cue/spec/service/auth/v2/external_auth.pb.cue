// Code generated from envoy/service/auth/v2/external_auth.proto. DO NOT EDIT.
package v2

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	status_3 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#CheckRequest: {
	"@type":     "type.googleapis.com/envoy.service.auth.v2.CheckRequest"
	attributes?: #AttributeContext
}

#DeniedHttpResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.DeniedHttpResponse"
	status!: type_1.#HttpStatus
	headers?: [...core_2.#HeaderValueOption]
	body?: string
}

#OkHttpResponse: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.OkHttpResponse"
	headers?: [...core_2.#HeaderValueOption]
}

#CheckResponse: {
	"@type":          "type.googleapis.com/envoy.service.auth.v2.CheckResponse"
	status?:          status_3.#Status
	denied_response?: #DeniedHttpResponse
	ok_response?:     #OkHttpResponse
}
