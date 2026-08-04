// Code generated from envoy/admin/v2alpha/metrics.proto. DO NOT EDIT.
package v2alpha

// Proto representation of an Envoy Counter or Gauge value.
#SimpleMetric: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.SimpleMetric"

	// Type of the metric represented.
	type?: #SimpleMetric_Type

	// Current metric value.
	value?: uint64

	// Name of the metric.
	name?: string
}

#SimpleMetric_Type: "COUNTER" | "GAUGE"
