// Code generated from envoy/config/trace/v3/xray.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#XRayConfig: {
	"@type":                 "type.googleapis.com/envoy.config.trace.v3.XRayConfig"
	daemon_endpoint?:        v3_1.#SocketAddress
	segment_name!:           string & strings.MinRunes(1)
	sampling_rule_manifest?: v3_1.#DataSource
	segment_fields?:         #XRayConfig_SegmentFields
}

#XRayConfig_SegmentFields: {
	"@type": "type.googleapis.com/envoy.config.trace.v3.XRayConfig.SegmentFields"
	origin?: string
	aws?: {...}
}
