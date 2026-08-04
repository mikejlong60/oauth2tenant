// Code generated from envoy/data/tap/v3/transport.proto. DO NOT EDIT.
package v3

// Event in a socket trace.
// [#next-free-field: 7]
#SocketEvent: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvent"

	// Timestamp for event.
	timestamp?: string

	// Connection information per event
	connection?: #Connection

	// Data sequence number
	seq_num?: uint64

	// Read or write with content as bytes string.
	// oneof event_selector: at most one may be set
	*{} |
	{read!: #SocketEvent_Read} |
	{write!: #SocketEvent_Write} |
	{closed!: #SocketEvent_Closed}
}

// Data read by Envoy from the transport socket.
#SocketEvent_Read: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvent.Read"

	// Binary data read.
	data?: #Body
}

// Data written by Envoy to the transport socket.
#SocketEvent_Write: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvent.Write"

	// Binary data written.
	data?: #Body

	// Stream was half closed after this write.
	end_stream?: bool
}

// The connection was closed.
#SocketEvent_Closed: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvent.Closed"
}

// Sequence of read/write events that constitute a buffered trace on a socket.
// [#next-free-field: 6]
#SocketBufferedTrace: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketBufferedTrace"

	// Trace ID unique to the originating Envoy only. Trace IDs can repeat and should not be used
	// for long term stable uniqueness. Matches connection IDs used in Envoy logs.
	trace_id?: uint64

	// Connection properties.
	connection?: #Connection

	// Sequence of observed events.
	events?: [...#SocketEvent]

	// Set to true if read events were truncated due to the :ref:`max_buffered_rx_bytes
	// <envoy_v3_api_field_config.tap.v3.OutputConfig.max_buffered_rx_bytes>` setting.
	read_truncated?: bool

	// Set to true if write events were truncated due to the :ref:`max_buffered_tx_bytes
	// <envoy_v3_api_field_config.tap.v3.OutputConfig.max_buffered_tx_bytes>` setting.
	write_truncated?: bool
}

// A message for the sequence of observed events
#SocketEvents: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketEvents"
	events?: [...#SocketEvent]
}

// A streamed socket trace segment. Multiple segments make up a full trace.
#SocketStreamedTraceSegment: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.SocketStreamedTraceSegment"

	// Trace ID unique to the originating Envoy only. Trace IDs can repeat and should not be used
	// for long term stable uniqueness. Matches connection IDs used in Envoy logs.
	trace_id?: uint64

	// oneof message_piece: at most one may be set
	*{} |
	{

		// Connection properties.
		connection!: #Connection
	} |
	{

		// Socket event.
		event!: #SocketEvent
	} |
	{

		// Sequence of observed events.
		events!: #SocketEvents
	}
}
