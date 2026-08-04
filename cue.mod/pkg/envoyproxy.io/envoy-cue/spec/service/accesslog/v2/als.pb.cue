// Code generated from envoy/service/accesslog/v2/als.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	v2_2 "envoyproxy.io/envoy-cue/spec/data/accesslog/v2"
)

#StreamAccessLogsResponse: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsResponse"
}

#StreamAccessLogsMessage: {
	"@type":     "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage"
	identifier?: #StreamAccessLogsMessage_Identifier

	// oneof log_entries: exactly one must be set
	{http_logs!: #StreamAccessLogsMessage_HTTPAccessLogEntries} |
	{tcp_logs!: #StreamAccessLogsMessage_TCPAccessLogEntries}
}

#StreamAccessLogsMessage_Identifier: {
	"@type":   "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage.Identifier"
	node!:     core_1.#Node
	log_name!: string & !=""
}

#StreamAccessLogsMessage_HTTPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage.HTTPAccessLogEntries"
	log_entry!: [...v2_2.#HTTPAccessLogEntry] & list.MinItems(1)
}

#StreamAccessLogsMessage_TCPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v2.StreamAccessLogsMessage.TCPAccessLogEntries"
	log_entry!: [...v2_2.#TCPAccessLogEntry] & list.MinItems(1)
}
