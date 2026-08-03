// Code generated from envoy/config/trace/v2alpha/xray.proto. DO NOT EDIT.
package v2alpha

import (
	"strings"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#XRayConfig: {
	"@type":                 "type.googleapis.com/envoy.config.trace.v2alpha.XRayConfig"
	daemon_endpoint?:        core_1.#SocketAddress
	segment_name!:           string & strings.MinRunes(1)
	sampling_rule_manifest?: core_1.#DataSource
}
