// Code generated from envoy/data/tap/v3/http.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#HttpBufferedTrace: {
	"@type":                "type.googleapis.com/envoy.data.tap.v3.HttpBufferedTrace"
	request?:               #HttpBufferedTrace_Message
	response?:              #HttpBufferedTrace_Message
	downstream_connection?: #Connection
	upstream_connection?:   #Connection
}

#HttpBufferedTrace_Message: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.HttpBufferedTrace.Message"
	headers?: [...v3_1.#HeaderValue]
	body?: #Body
	trailers?: [...v3_1.#HeaderValue]
	headers_received_time?: string
}

#HttpStreamedTraceSegment: {
	"@type":              "type.googleapis.com/envoy.data.tap.v3.HttpStreamedTraceSegment"
	trace_id?:            uint64
	request_headers?:     v3_1.#HeaderMap
	request_body_chunk?:  #Body
	request_trailers?:    v3_1.#HeaderMap
	response_headers?:    v3_1.#HeaderMap
	response_body_chunk?: #Body
	response_trailers?:   v3_1.#HeaderMap
}
