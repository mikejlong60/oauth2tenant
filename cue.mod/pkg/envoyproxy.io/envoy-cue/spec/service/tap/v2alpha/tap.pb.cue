// Code generated from envoy/service/tap/v2alpha/tap.proto. DO NOT EDIT.
package v2alpha

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/data/tap/v2alpha"
)

#StreamTapsRequest: {
	"@type":     "type.googleapis.com/envoy.service.tap.v2alpha.StreamTapsRequest"
	identifier?: #StreamTapsRequest_Identifier
	trace_id?:   uint64
	trace?:      v2alpha_1.#TraceWrapper
}

#StreamTapsRequest_Identifier: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.StreamTapsRequest.Identifier"
	node!:   core_2.#Node
	tap_id?: string
}

#StreamTapsResponse: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.StreamTapsResponse"
}
