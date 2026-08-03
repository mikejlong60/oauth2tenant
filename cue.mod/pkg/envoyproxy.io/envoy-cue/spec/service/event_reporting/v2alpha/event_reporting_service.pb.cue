// Code generated from envoy/service/event_reporting/v2alpha/event_reporting_service.proto. DO NOT EDIT.
package v2alpha

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#StreamEventsRequest: {
	"@type":     "type.googleapis.com/envoy.service.event_reporting.v2alpha.StreamEventsRequest"
	identifier?: #StreamEventsRequest_Identifier
	events!: [...{...}] & list.MinItems(1)
}

#StreamEventsRequest_Identifier: {
	"@type": "type.googleapis.com/envoy.service.event_reporting.v2alpha.StreamEventsRequest.Identifier"
	node!:   core_1.#Node
}

#StreamEventsResponse: {
	"@type": "type.googleapis.com/envoy.service.event_reporting.v2alpha.StreamEventsResponse"
}
