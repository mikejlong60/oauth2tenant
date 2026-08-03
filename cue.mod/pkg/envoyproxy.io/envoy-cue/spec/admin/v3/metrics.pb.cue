// Code generated from envoy/admin/v3/metrics.proto. DO NOT EDIT.
package v3

#SimpleMetric: {
	"@type": "type.googleapis.com/envoy.admin.v3.SimpleMetric"
	type?:   #SimpleMetric_Type
	value?:  uint64
	name?:   string
}

#SimpleMetric_Type: "COUNTER" | "GAUGE"
