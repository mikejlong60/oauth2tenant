// Code generated from envoy/api/v2/cluster/outlier_detection.proto. DO NOT EDIT.
package cluster

#OutlierDetection: {
	"@type":                                     "type.googleapis.com/envoy.api.v2.cluster.OutlierDetection"
	consecutive_5xx?:                            uint32
	interval?:                                   string // TODO(pgv): duration bounds
	base_ejection_time?:                         string // TODO(pgv): duration bounds
	max_ejection_percent?:                       uint32 & <=100
	enforcing_consecutive_5xx?:                  uint32 & <=100
	enforcing_success_rate?:                     uint32 & <=100
	success_rate_minimum_hosts?:                 uint32
	success_rate_request_volume?:                uint32
	success_rate_stdev_factor?:                  uint32
	consecutive_gateway_failure?:                uint32
	enforcing_consecutive_gateway_failure?:      uint32 & <=100
	split_external_local_origin_errors?:         bool
	consecutive_local_origin_failure?:           uint32
	enforcing_consecutive_local_origin_failure?: uint32 & <=100
	enforcing_local_origin_success_rate?:        uint32 & <=100
	failure_percentage_threshold?:               uint32 & <=100
	enforcing_failure_percentage?:               uint32 & <=100
	enforcing_failure_percentage_local_origin?:  uint32 & <=100
	failure_percentage_minimum_hosts?:           uint32
	failure_percentage_request_volume?:          uint32
}
