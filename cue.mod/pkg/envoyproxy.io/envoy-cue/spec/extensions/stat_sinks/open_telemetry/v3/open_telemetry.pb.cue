// Code generated from envoy/extensions/stat_sinks/open_telemetry/v3/open_telemetry.proto. DO NOT EDIT.
package v3

import (
	v1_3 "envoyproxy.io/envoy-cue/spec/deps/go.opentelemetry.io/proto/otlp/common/v1"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

// [#next-free-field: 9]
#SinkConfig: {
	"@type": "type.googleapis.com/envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig"

	// Attributes to be associated with the resource in the OTLP message.
	// [#extension-category: envoy.tracers.opentelemetry.resource_detectors]
	resource_detectors?: [...v3_1.#TypedExtensionConfig]

	// If set to true, counters will be emitted as deltas, and the OTLP message will have
	// ``AGGREGATION_TEMPORALITY_DELTA`` set as AggregationTemporality.
	report_counters_as_deltas?: bool

	// If set to true, histograms will be emitted as deltas, and the OTLP message will have
	// ``AGGREGATION_TEMPORALITY_DELTA`` set as AggregationTemporality.
	report_histograms_as_deltas?: bool

	// If set to true, metrics will have their tags emitted as OTLP attributes, which may
	// contain values used by the tag extractor or additional tags added during stats creation.
	// Otherwise, no attributes will be associated with the export message. Default value is true.
	emit_tags_as_attributes?: bool

	// If set to true, metric names will be represented as the tag extracted name instead
	// of the full metric name. Default value is true.
	use_tag_extracted_name?: bool

	// If set, emitted stats names will be prepended with a prefix, so full stat name will be
	// <prefix>.<stats_name>. For example, if the stat name is "foo.bar" and prefix is
	// "pre", the full stat name will be "pre.foo.bar". If this field is not set, there is no
	// prefix added. According to the example, the full stat name will remain "foo.bar".
	prefix?: string

	// The custom conversion from a stat to a metric. Currently, the only supported input is
	// ``envoy.extensions.matching.common_inputs.stats.v3.StatFullNameMatchInput``.
	// The supported actions are
	// - ``envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.DropAction``.
	// - ``envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.ConversionAction``.
	// If stats are not matched, they will be directly converted to OTLP metrics as usual.
	custom_metric_conversions?: v3_2.#Matcher

	// oneof protocol_specifier: exactly one must be set
	// The upstream gRPC cluster that implements the OTLP/gRPC collector.
	{grpc_service!: v3_1.#GrpcService}
}

// ConversionAction is used to convert a stat to a metric. If a stat matches,
// the metric_name and static_metric_labels will be
// used to create the metric. This can be used to rename a
// stat, add static labels, and aggregate multiple stats into a single metric.
#SinkConfig_ConversionAction: {
	"@type": "type.googleapis.com/envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.ConversionAction"

	// The metric name to use for the stat.
	metric_name?: string

	// Static metric labels to use for the metric.
	static_metric_labels?: [...v1_3.#KeyValue]
}

// DropAction is an action that, when matched, will prevent the stat from being converted to an OTLP metric and flushed.
#SinkConfig_DropAction: {
	"@type": "type.googleapis.com/envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.DropAction"
}
