// Code generated from envoy/service/accesslog/v3/als.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/data/accesslog/v3"
)

// Empty response for the StreamAccessLogs API. Will never be sent. See below.
#StreamAccessLogsResponse: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsResponse"
}

// Stream message for the StreamAccessLogs API. Envoy will open a stream to the server and stream
// access logs without ever expecting a response.
#StreamAccessLogsMessage: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage"

	// Identifier data that will only be sent in the first message on the stream. This is effectively
	// structured metadata and is a performance optimization.
	identifier?: #StreamAccessLogsMessage_Identifier

	// Batches of log entries of a single type. Generally speaking, a given stream should only
	// ever include one type of log entry.
	// oneof log_entries: exactly one must be set
	{http_logs!: #StreamAccessLogsMessage_HTTPAccessLogEntries} |
	{tcp_logs!: #StreamAccessLogsMessage_TCPAccessLogEntries}
}

#StreamAccessLogsMessage_Identifier: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage.Identifier"

	// The node sending the access log messages over the stream.
	node!: v3_1.#Node

	// The friendly name of the log configured in :ref:`CommonGrpcAccessLogConfig
	// <envoy_v3_api_msg_extensions.access_loggers.grpc.v3.CommonGrpcAccessLogConfig>`.
	log_name!: string & strings.MinRunes(1)
}

// Wrapper for batches of HTTP access log entries.
#StreamAccessLogsMessage_HTTPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage.HTTPAccessLogEntries"
	log_entry!: [...v3_2.#HTTPAccessLogEntry] & list.MinItems(1)
}

// Wrapper for batches of TCP access log entries.
#StreamAccessLogsMessage_TCPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage.TCPAccessLogEntries"
	log_entry!: [...v3_2.#TCPAccessLogEntry] & list.MinItems(1)
}
