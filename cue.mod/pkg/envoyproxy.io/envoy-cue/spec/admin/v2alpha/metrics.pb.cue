// Code generated from envoy/admin/v2alpha/metrics.proto. DO NOT EDIT.
package v2alpha

#SimpleMetric: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.SimpleMetric"
	type?:   #SimpleMetric_Type
	value?:  uint64
	name?:   string
}

#SimpleMetric_Type: "COUNTER" | "GAUGE"
