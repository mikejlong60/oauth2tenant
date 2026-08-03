// Code generated from envoy/service/accesslog/v3/als.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/data/accesslog/v3"
)

#StreamAccessLogsResponse: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsResponse"
}

#StreamAccessLogsMessage: {
	"@type":     "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage"
	identifier?: #StreamAccessLogsMessage_Identifier
	http_logs?:  #StreamAccessLogsMessage_HTTPAccessLogEntries
	tcp_logs?:   #StreamAccessLogsMessage_TCPAccessLogEntries
}

#StreamAccessLogsMessage_Identifier: {
	"@type":   "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage.Identifier"
	node!:     v3_1.#Node
	log_name!: string & strings.MinRunes(1)
}

#StreamAccessLogsMessage_HTTPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage.HTTPAccessLogEntries"
	log_entry!: [...v3_2.#HTTPAccessLogEntry] & list.MinItems(1)
}

#StreamAccessLogsMessage_TCPAccessLogEntries: {
	"@type": "type.googleapis.com/envoy.service.accesslog.v3.StreamAccessLogsMessage.TCPAccessLogEntries"
	log_entry!: [...v3_2.#TCPAccessLogEntry] & list.MinItems(1)
}
