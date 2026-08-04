// Code generated from envoy/data/tap/v3/wrapper.proto. DO NOT EDIT.
package v3

#TraceWrapper: {
	"@type": "type.googleapis.com/envoy.data.tap.v3.TraceWrapper"

	// oneof trace: exactly one must be set
	{http_buffered_trace!: #HttpBufferedTrace} |
	{http_streamed_trace_segment!: #HttpStreamedTraceSegment} |
	{socket_buffered_trace!: #SocketBufferedTrace} |
	{socket_streamed_trace_segment!: #SocketStreamedTraceSegment}
}
