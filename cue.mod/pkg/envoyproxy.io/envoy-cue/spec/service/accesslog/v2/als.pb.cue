// Code generated from envoy/service/accesslog/v2/als.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	v2_2 "envoyproxy.io/envoy-cue/spec/data/accesslog/v2"
)

// Empty response for the StreamAccessLogs API. Will never be sent. See below.
#StreamAccessLogsResponse: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsResponse"
}

// Stream message for the StreamAccessLogs API. Envoy will open a stream to the server and stream
// access logs without ever expecting a response.
#StreamAccessLogsMessage: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage"

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
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage.Identifier"

	// The node sending the access log messages over the stream.
	node!: core_1.#Node

	// The friendly name of the log configured in :ref:`CommonGrpcAccessLogConfig
	// <envoy_api_msg_config.accesslog.v2.CommonGrpcAccessLogConfig>`.
	log_name!: string & !=""
}

// Wrapper for batches of HTTP access log entries.
#StreamAccessLogsMessage_HTTPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage.HTTPAccessLogEntries"
	log_entry!: [...v2_2.#HTTPAccessLogEntry] & list.MinItems(1)
}

// Wrapper for batches of TCP access log entries.
#StreamAccessLogsMessage_TCPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage.TCPAccessLogEntries"
	log_entry!: [...v2_2.#TCPAccessLogEntry] & list.MinItems(1)
}
