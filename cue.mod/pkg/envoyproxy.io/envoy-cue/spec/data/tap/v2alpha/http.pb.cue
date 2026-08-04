// Code generated from envoy/data/tap/v2alpha/http.proto. DO NOT EDIT.
package v2alpha

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

// A fully buffered HTTP trace message.
#HttpBufferedTrace: {
	"@type": "type.googleapis.com/envoy.data.tap.v2alpha.HttpBufferedTrace"

	// Request message.
	request?: #HttpBufferedTrace_Message

	// Response message.
	response?: #HttpBufferedTrace_Message
}

// HTTP message wrapper.
#HttpBufferedTrace_Message: {
	"@type": "type.googleapis.com/envoy.data.tap.v2alpha.HttpBufferedTrace.Message"

	// Message headers.
	headers?: [...core_1.#HeaderValue]

	// Message body.
	body?: #Body

	// Message trailers.
	trailers?: [...core_1.#HeaderValue]
}

// A streamed HTTP trace segment. Multiple segments make up a full trace.
// [#next-free-field: 8]
#HttpStreamedTraceSegment: {
	"@type": "type.googleapis.com/envoy.data.tap.v2alpha.HttpStreamedTraceSegment"

	// Trace ID unique to the originating Envoy only. Trace IDs can repeat and should not be used
	// for long term stable uniqueness.
	trace_id?: uint64

	// oneof message_piece: at most one may be set
	*{} |
	{

		// Request headers.
		request_headers!: core_1.#HeaderMap
	} |
	{

		// Request body chunk.
		request_body_chunk!: #Body
	} |
	{

		// Request trailers.
		request_trailers!: core_1.#HeaderMap
	} |
	{

		// Response headers.
		response_headers!: core_1.#HeaderMap
	} |
	{

		// Response body chunk.
		response_body_chunk!: #Body
	} |
	{

		// Response trailers.
		response_trailers!: core_1.#HeaderMap
	}
}
