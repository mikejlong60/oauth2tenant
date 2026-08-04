// Code generated from envoy/service/tap/v3/tap.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/data/tap/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// [#not-implemented-hide:] Stream message for the Tap API. Envoy will open a stream to the server
// and stream taps without ever expecting a response.
#StreamTapsRequest: {
	"@type": "type.googleapis.com/envoy.service.tap.v3.StreamTapsRequest"

	// Identifier data effectively is a structured metadata. As a performance optimization this will
	// only be sent in the first message on the stream.
	identifier?: #StreamTapsRequest_Identifier

	// The trace id. this can be used to merge together a streaming trace. Note that the trace_id
	// is not guaranteed to be spatially or temporally unique.
	trace_id?: uint64

	// The trace data.
	trace?: v3_1.#TraceWrapper
}

#StreamTapsRequest_Identifier: {
	"@type": "type.googleapis.com/envoy.service.tap.v3.StreamTapsRequest.Identifier"

	// The node sending taps over the stream.
	node!: v3_2.#Node

	// The opaque identifier that was set in the :ref:`output config
	// <envoy_v3_api_field_config.tap.v3.StreamingGrpcSink.tap_id>`.
	tap_id?: string
}

// [#not-implemented-hide:]
#StreamTapsResponse: {
	"@type": "type.googleapis.com/envoy.service.tap.v3.StreamTapsResponse"
}
