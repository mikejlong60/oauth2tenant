// Code generated from envoy/config/trace/v3/lightstep.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#LightstepConfig: {
	"@type":            "type.googleapis.com/envoy.config.trace.v3.LightstepConfig"
	collector_cluster!: string & strings.MinRunes(1)
	access_token_file?: string
	access_token?:      v3_1.#DataSource
	propagation_modes?: [...#LightstepConfig_PropagationMode]
}

#LightstepConfig_PropagationMode: "ENVOY" | "LIGHTSTEP" | "B3" | "TRACE_CONTEXT"
