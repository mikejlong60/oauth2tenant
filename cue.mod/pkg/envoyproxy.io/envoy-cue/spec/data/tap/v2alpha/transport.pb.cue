// Code generated from envoy/data/tap/v2alpha/transport.proto. DO NOT EDIT.
package v2alpha

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#Connection: {
	"@type":         "type.googleapis.com/envoy.data.tap.v2alpha.Connection"
	local_address?:  core_1.#Address
	remote_address?: core_1.#Address
}

#SocketEvent: {
	"@type":    "type.googleapis.com/envoy.data.tap.v2alpha.SocketEvent"
	timestamp?: string
	read?:      #SocketEvent_Read
	write?:     #SocketEvent_Write
	closed?:    #SocketEvent_Closed
}

#SocketEvent_Read: {
	"@type": "type.googleapis.com/envoy.data.tap.v2alpha.SocketEvent.Read"
	data?:   #Body
}

#SocketEvent_Write: {
	"@type":     "type.googleapis.com/envoy.data.tap.v2alpha.SocketEvent.Write"
	data?:       #Body
	end_stream?: bool
}

#SocketEvent_Closed: {
	"@type": "type.googleapis.com/envoy.data.tap.v2alpha.SocketEvent.Closed"
}

#SocketBufferedTrace: {
	"@type":     "type.googleapis.com/envoy.data.tap.v2alpha.SocketBufferedTrace"
	trace_id?:   uint64
	connection?: #Connection
	events?: [...#SocketEvent]
	read_truncated?:  bool
	write_truncated?: bool
}

#SocketStreamedTraceSegment: {
	"@type":     "type.googleapis.com/envoy.data.tap.v2alpha.SocketStreamedTraceSegment"
	trace_id?:   uint64
	connection?: #Connection
	event?:      #SocketEvent
}
