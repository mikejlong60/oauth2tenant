// Code generated from envoy/service/metrics/v3/metrics_service.proto. DO NOT EDIT.
package v3

import (
	go_1 "envoyproxy.io/envoy-cue/spec/deps/prometheus/client_model/go"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#StreamMetricsResponse: {
	"@type": "type.googleapis.com/envoy.service.metrics.v3.StreamMetricsResponse"
}

#StreamMetricsMessage: {
	"@type": "type.googleapis.com/envoy.service.metrics.v3.StreamMetricsMessage"

	// Identifier data effectively is a structured metadata. As a performance optimization this will
	// only be sent in the first message on the stream.
	identifier?: #StreamMetricsMessage_Identifier

	// A list of metric entries
	envoy_metrics?: [...go_1.#MetricFamily]
}

#StreamMetricsMessage_Identifier: {
	"@type": "type.googleapis.com/envoy.service.metrics.v3.StreamMetricsMessage.Identifier"

	// The node sending metrics over the stream.
	node!: v3_2.#Node
}
