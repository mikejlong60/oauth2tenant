// Code generated from envoy/extensions/filters/http/grpc_http1_reverse_bridge/v3/config.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#FilterConfig: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.grpc_http1_reverse_bridge.v3.FilterConfig"
	content_type!:         string & strings.MinRunes(1)
	withhold_grpc_frames?: bool
	response_size_header?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#FilterConfigPerRoute: {
	"@type":   "type.googleapis.com/envoy.extensions.filters.http.grpc_http1_reverse_bridge.v3.FilterConfigPerRoute"
	disabled?: bool
}
