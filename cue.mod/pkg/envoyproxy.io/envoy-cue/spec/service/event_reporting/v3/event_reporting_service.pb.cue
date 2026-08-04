// Code generated from envoy/service/event_reporting/v3/event_reporting_service.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// [#not-implemented-hide:]
// An events envoy sends to the management server.
#StreamEventsRequest: {
	"@type": "type.googleapis.com/envoy.service.event_reporting.v3.StreamEventsRequest"

	// Identifier data that will only be sent in the first message on the stream. This is effectively
	// structured metadata and is a performance optimization.
	identifier?: #StreamEventsRequest_Identifier

	// Batch of events. When the stream is already active, it will be the events occurred
	// since the last message had been sent. If the server receives unknown event type, it should
	// silently ignore it.
	//
	// The following events are supported:
	//
	// * :ref:`HealthCheckEvent <envoy_v3_api_msg_data.core.v3.HealthCheckEvent>`
	// * :ref:`OutlierDetectionEvent <envoy_v3_api_msg_data.cluster.v3.OutlierDetectionEvent>`
	events!: [...{...}] & list.MinItems(1)
}

#StreamEventsRequest_Identifier: {
	"@type": "type.googleapis.com/envoy.service.event_reporting.v3.StreamEventsRequest.Identifier"

	// The node sending the event messages over the stream.
	node!: v3_1.#Node
}

// [#not-implemented-hide:]
// The management server may send envoy a StreamEventsResponse to tell which events the server
// is interested in. In future, with aggregated event reporting service, this message will
// contain, for example, clusters the envoy should send events for, or event types the server
// wants to process.
#StreamEventsResponse: {
	"@type": "type.googleapis.com/envoy.service.event_reporting.v3.StreamEventsResponse"
}
