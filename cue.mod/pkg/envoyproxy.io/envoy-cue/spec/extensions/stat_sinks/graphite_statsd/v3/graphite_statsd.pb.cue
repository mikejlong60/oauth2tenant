// Code generated from envoy/extensions/stat_sinks/graphite_statsd/v3/graphite_statsd.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#GraphiteStatsdSink: {
	"@type": "type.googleapis.com/envoy.extensions.stat_sinks.graphite_statsd.v3.GraphiteStatsdSink"

	// Optional custom metric name prefix. See :ref:`StatsdSink's prefix field
	// <envoy_v3_api_field_config.metrics.v3.StatsdSink.prefix>` for more details.
	prefix?: string

	// Optional max datagram size to use when sending UDP messages. By default Envoy
	// will emit one metric per datagram. By specifying a max-size larger than a single
	// metric, Envoy will emit multiple, new-line separated metrics. The max datagram
	// size should not exceed your network's MTU.
	//
	// Note that this value may not be respected if smaller than a single metric.
	max_bytes_per_datagram?: uint64 & >0

	// oneof statsd_specifier: exactly one must be set
	// The UDP address of a running Graphite-compliant listener. If specified,
	// statistics will be flushed to this address.
	{address!: v3_1.#Address}
}
