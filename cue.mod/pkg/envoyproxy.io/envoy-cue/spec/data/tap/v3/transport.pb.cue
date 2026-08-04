// Code generated from envoy/data/tap/v3/transport.proto. DO NOT EDIT.
package v3

#SocketEvent: {
	"@type":     "type.googleapis.com/envoy.data.tap.v3.SocketEvent"
	timestamp?:  string
	connection?: #Connection
	seq_num?:    uint64

	// oneof event_selector: at most one may be set
	*{} |
	{read!: #SocketEvent_Read} |
	{write!: #SocketEvent_Write} |
	{closed!: #SocketEvent_Closed}
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
	"@type":   "type.googleapis.com/envoy.data.tap.v3.SocketStreamedTraceSegment"
	trace_id?: uint64

	// oneof message_piece: at most one may be set
	*{} |
	{connection!: #Connection} |
	{event!: #SocketEvent} |
	{events!: #SocketEvents}
}
