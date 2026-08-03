// Code generated from envoy/extensions/access_loggers/open_telemetry/v3/logs_service.proto. DO NOT EDIT.
package v3

import (
	v1_3 "envoyproxy.io/envoy-cue/spec/deps/go.opentelemetry.io/proto/otlp/common/v1"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/access_loggers/grpc/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/type/tracing/v3"
)

#OpenTelemetryAccessLogConfig: {
	"@type":                 "type.googleapis.com/envoy.extensions.access_loggers.open_telemetry.v3.OpenTelemetryAccessLogConfig"
	common_config?:          v3_1.#CommonGrpcAccessLogConfig
	http_service?:           v3_2.#HttpService
	grpc_service?:           v3_2.#GrpcService
	disable_builtin_labels?: bool
	resource_attributes?:    v1_3.#KeyValueList
	body?:                   v1_3.#AnyValue
	attributes?:             v1_3.#KeyValueList
	stat_prefix?:            string
	formatters?: [...v3_2.#TypedExtensionConfig]
	log_name?:              string
	buffer_flush_interval?: string
	buffer_size_bytes?:     uint32
	filter_state_objects_to_log?: [...string]
	custom_tags?: [...v3_4.#CustomTag]
}
