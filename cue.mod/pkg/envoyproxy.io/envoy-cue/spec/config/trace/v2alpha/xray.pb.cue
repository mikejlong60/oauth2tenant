// Code generated from envoy/config/trace/v2alpha/xray.proto. DO NOT EDIT.
package v2alpha

import (
	"strings"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#XRayConfig: {
	"@type": "type.googleapis.com/envoy.config.trace.v2alpha.XRayConfig"

	// The UDP endpoint of the X-Ray Daemon where the spans will be sent.
	// If this value is not set, the default value of 127.0.0.1:2000 will be used.
	daemon_endpoint?: core_1.#SocketAddress

	// The name of the X-Ray segment.
	segment_name!: string & strings.MinRunes(1)

	// The location of a local custom sampling rules JSON file.
	// For an example of the sampling rules see:
	// `X-Ray SDK documentation
	// <https://docs.aws.amazon.com/xray/latest/devguide/xray-sdk-go-configuration.html#xray-sdk-go-configuration-sampling>`_
	sampling_rule_manifest?: core_1.#DataSource
}
