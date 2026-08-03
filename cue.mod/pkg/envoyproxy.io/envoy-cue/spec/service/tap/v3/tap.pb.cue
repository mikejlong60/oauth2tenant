// Code generated from envoy/service/tap/v3/tap.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/data/tap/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#StreamTapsRequest: {
	"@type":     "type.googleapis.com/envoy.service.tap.v3.StreamTapsRequest"
	identifier?: #StreamTapsRequest_Identifier
	trace_id?:   uint64
	trace?:      v3_1.#TraceWrapper
}

#StreamTapsRequest_Identifier: {
	"@type": "type.googleapis.com/envoy.service.tap.v3.StreamTapsRequest.Identifier"
	node!:   v3_2.#Node
	tap_id?: string
}

#StreamTapsResponse: {
	"@type": "type.googleapis.com/envoy.service.tap.v3.StreamTapsResponse"
}
