// Code generated from envoy/config/trace/v3/opentelemetry.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#OpenTelemetryConfig: {
	"@type":       "type.googleapis.com/envoy.config.trace.v3.OpenTelemetryConfig"
	grpc_service?: v3_1.#GrpcService
	http_service?: v3_1.#HttpService
	service_name?: string
	resource_detectors?: [...v3_1.#TypedExtensionConfig]
	sampler?:        v3_1.#TypedExtensionConfig
	max_cache_size?: uint32
}
