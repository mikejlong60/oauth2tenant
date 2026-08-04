// Code generated from envoy/data/tap/v2alpha/wrapper.proto. DO NOT EDIT.
package v2alpha

#TraceWrapper: {
	"@type": "type.googleapis.com/envoy.data.tap.v2alpha.TraceWrapper"

	// oneof trace: exactly one must be set
	{http_buffered_trace!: #HttpBufferedTrace} |
	{http_streamed_trace_segment!: #HttpStreamedTraceSegment} |
	{socket_buffered_trace!: #SocketBufferedTrace} |
	{socket_streamed_trace_segment!: #SocketStreamedTraceSegment}
}
