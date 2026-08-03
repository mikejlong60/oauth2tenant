// Code generated from envoy/data/tap/v3/transport.proto. DO NOT EDIT.
package v3

#SocketEvent: {
	"@type":     "type.googleapis.com/envoy.data.tap.v3.SocketEvent"
	timestamp?:  string
	read?:       #SocketEvent_Read
	write?:      #SocketEvent_Write
	closed?:     #SocketEvent_Closed
	connection?: #Connection
	seq_num?:    uint64
}

#SocketEvent_Read: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvent.Read"
	data?:   #Body
}

#SocketEvent_Write: {
	"@type":     "type.googleapis.com/envoy.data.tap.v3.SocketEvent.Write"
	data?:       #Body
	end_stream?: bool
}

#SocketEvent_Closed: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvent.Closed"
}

#SocketBufferedTrace: {
	"@type":     "type.googleapis.com/envoy.data.tap.v3.SocketBufferedTrace"
	trace_id?:   uint64
	connection?: #Connection
	events?: [...#SocketEvent]
	read_truncated?:  bool
	write_truncated?: bool
}

#SocketEvents: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvents"
	events?: [...#SocketEvent]
}

#SocketStreamedTraceSegment: {
	"@type":     "type.googleapis.com/envoy.data.tap.v3.SocketStreamedTraceSegment"
	trace_id?:   uint64
	connection?: #Connection
	event?:      #SocketEvent
	events?:     #SocketEvents
}
