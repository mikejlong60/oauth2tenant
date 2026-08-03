// Code generated from envoy/extensions/filters/http/tap/v3/tap.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/tap/v3"
)

#Tap: {
	"@type":                       "type.googleapis.com/envoy.extensions.filters.http.tap.v3.Tap"
	common_config!:                v3_1.#CommonExtensionConfig
	record_headers_received_time?: bool
	record_downstream_connection?: bool
	record_upstream_connection?:   bool
}
