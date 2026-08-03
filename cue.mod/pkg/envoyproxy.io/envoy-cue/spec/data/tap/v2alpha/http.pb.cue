// Code generated from envoy/data/tap/v2alpha/http.proto. DO NOT EDIT.
package v2alpha

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#HttpBufferedTrace: {
	"@type":   "type.googleapis.com/envoy.data.tap.v2alpha.HttpBufferedTrace"
	request?:  #HttpBufferedTrace_Message
	response?: #HttpBufferedTrace_Message
}

#HttpBufferedTrace_Message: {
	"@type": "type.googleapis.com/envoy.data.tap.v2alpha.HttpBufferedTrace.Message"
	headers?: [...core_1.#HeaderValue]
	body?: #Body
	trailers?: [...core_1.#HeaderValue]
}

#HttpStreamedTraceSegment: {
	"@type":              "type.googleapis.com/envoy.data.tap.v2alpha.HttpStreamedTraceSegment"
	trace_id?:            uint64
	request_headers?:     core_1.#HeaderMap
	request_body_chunk?:  #Body
	request_trailers?:    core_1.#HeaderMap
	response_headers?:    core_1.#HeaderMap
	response_body_chunk?: #Body
	response_trailers?:   core_1.#HeaderMap
}
