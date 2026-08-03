// Code generated from envoy/extensions/stat_sinks/open_telemetry/v3/open_telemetry.proto. DO NOT EDIT.
package v3

import (
	v1_3 "envoyproxy.io/envoy-cue/spec/deps/go.opentelemetry.io/proto/otlp/common/v1"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

#SinkConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig"
	grpc_service!: v3_1.#GrpcService
	resource_detectors?: [...v3_1.#TypedExtensionConfig]
	report_counters_as_deltas?:   bool
	report_histograms_as_deltas?: bool
	emit_tags_as_attributes?:     bool
	use_tag_extracted_name?:      bool
	prefix?:                      string
	custom_metric_conversions?:   v3_2.#Matcher
}

#SinkConfig_ConversionAction: {
	"@type":      "type.googleapis.com/envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.ConversionAction"
	metric_name?: string
	static_metric_labels?: [...v1_3.#KeyValue]
}

#SinkConfig_DropAction: {
	"@type": "type.googleapis.com/envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.DropAction"
}
