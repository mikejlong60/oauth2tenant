// Code generated from envoy/extensions/tracers/opentelemetry/samplers/v3/dynatrace_sampler.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#DynatraceSamplerConfig: {
	"@type":                "type.googleapis.com/envoy.extensions.tracers.opentelemetry.samplers.v3.DynatraceSamplerConfig"
	tenant?:                string
	cluster_id?:            int32
	http_service?:          v3_1.#HttpService
	root_spans_per_minute?: uint32
}
