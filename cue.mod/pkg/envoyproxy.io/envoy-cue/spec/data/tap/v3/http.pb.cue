// Code generated from envoy/data/tap/v3/http.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// A fully buffered HTTP trace message.
#HttpBufferedTrace: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.HttpBufferedTrace"

	// Request message.
	request?: #HttpBufferedTrace_Message

	// Response message.
	response?: #HttpBufferedTrace_Message

	// downstream connection
	downstream_connection?: #Connection

	// upstream connection
	upstream_connection?: #Connection
}

// HTTP message wrapper.
#HttpBufferedTrace_Message: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.HttpBufferedTrace.Message"

	// Message headers.
	headers?: [...v3_1.#HeaderValue]

	// Message body.
	body?: #Body

	// Message trailers.
	trailers?: [...v3_1.#HeaderValue]

	// The timestamp after receiving the message headers.
	headers_received_time?: string
}

// A streamed HTTP trace segment. Multiple segments make up a full trace.
// [#next-free-field: 8]
#HttpStreamedTraceSegment: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.HttpStreamedTraceSegment"

	// Trace ID unique to the originating Envoy only. Trace IDs can repeat and should not be used
	// for long term stable uniqueness.
	trace_id?: uint64

	// oneof message_piece: at most one may be set
	*{} |
	{

		// Request headers.
		request_headers!: v3_1.#HeaderMap
	} |
	{

		// Request body chunk.
		request_body_chunk!: #Body
	} |
	{

		// Request trailers.
		request_trailers!: v3_1.#HeaderMap
	} |
	{

		// Response headers.
		response_headers!: v3_1.#HeaderMap
	} |
	{

		// Response body chunk.
		response_body_chunk!: #Body
	} |
	{

		// Response trailers.
		response_trailers!: v3_1.#HeaderMap
	}
}
