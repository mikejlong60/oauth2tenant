// Code generated from envoy/admin/v3/metrics.proto. DO NOT EDIT.
package v3

// Proto representation of an Envoy Counter or Gauge value.
#SimpleMetric: {
	"@type": "type.googleapis.com/envoy.admin.v3.SimpleMetric"

	// Type of the metric represented.
	type?: #SimpleMetric_Type

	// Current metric value.
	value?: uint64

	// Name of the metric.
	name?: string
}

#SimpleMetric_Type: "COUNTER" | "GAUGE"
