// Code generated from envoy/extensions/stat_sinks/graphite_statsd/v3/graphite_statsd.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#GraphiteStatsdSink: {
	"@type":                 "type.googleapis.com/envoy.extensions.stat_sinks.graphite_statsd.v3.GraphiteStatsdSink"
	prefix?:                 string
	max_bytes_per_datagram?: uint64 & >0

	// oneof statsd_specifier: exactly one must be set
	{address!: v3_1.#Address}
}
