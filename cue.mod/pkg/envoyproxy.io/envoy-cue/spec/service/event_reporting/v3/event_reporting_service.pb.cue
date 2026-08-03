// Code generated from envoy/service/event_reporting/v3/event_reporting_service.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#StreamEventsRequest: {
	"@type":     "type.googleapis.com/envoy.service.event_reporting.v3.StreamEventsRequest"
	identifier?: #StreamEventsRequest_Identifier
	events!: [...{...}] & list.MinItems(1)
}

#StreamEventsRequest_Identifier: {
	"@type": "type.googleapis.com/envoy.service.event_reporting.v3.StreamEventsRequest.Identifier"
	node!:   v3_1.#Node
}

#StreamEventsResponse: {
	"@type": "type.googleapis.com/envoy.service.event_reporting.v3.StreamEventsResponse"
}
