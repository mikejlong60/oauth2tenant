// Code generated from envoy/config/metrics/v3/metrics_service.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#MetricsServiceConfig: {
	"@type":                    "type.googleapis.com/envoy.config.metrics.v3.MetricsServiceConfig"
	grpc_service!:              v3_1.#GrpcService
	transport_api_version?:     v3_1.#ApiVersion
	report_counters_as_deltas?: bool
	emit_tags_as_labels?:       bool
	histogram_emit_mode?:       #HistogramEmitMode
	batch_size?:                uint32 & >=0
}

#HistogramEmitMode: "SUMMARY_AND_HISTOGRAM" | "SUMMARY" | "HISTOGRAM"
