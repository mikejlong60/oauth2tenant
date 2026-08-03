// Code generated from envoy/data/cluster/v2alpha/outlier_detection_event.proto. DO NOT EDIT.
package v2alpha

#OutlierDetectionEvent: {
	"@type":                         "type.googleapis.com/envoy.data.cluster.v2alpha.OutlierDetectionEvent"
	type?:                           #OutlierEjectionType
	timestamp?:                      string
	secs_since_last_action?:         uint64
	cluster_name!:                   string & !=""
	upstream_url!:                   string & !=""
	action?:                         #Action
	num_ejections?:                  uint32
	enforced?:                       bool
	eject_success_rate_event?:       #OutlierEjectSuccessRate
	eject_consecutive_event?:        #OutlierEjectConsecutive
	eject_failure_percentage_event?: #OutlierEjectFailurePercentage
}

#OutlierEjectSuccessRate: {
	"@type":                                  "type.googleapis.com/envoy.data.cluster.v2alpha.OutlierEjectSuccessRate"
	host_success_rate?:                       uint32 & <=100
	cluster_average_success_rate?:            uint32 & <=100
	cluster_success_rate_ejection_threshold?: uint32 & <=100
}

#OutlierEjectConsecutive: {
	"@type": "type.googleapis.com/envoy.data.cluster.v2alpha.OutlierEjectConsecutive"
}

#OutlierEjectFailurePercentage: {
	"@type":            "type.googleapis.com/envoy.data.cluster.v2alpha.OutlierEjectFailurePercentage"
	host_success_rate?: uint32 & <=100
}

#OutlierEjectionType: "CONSECUTIVE_5XX" | "CONSECUTIVE_GATEWAY_FAILURE" | "SUCCESS_RATE" | "CONSECUTIVE_LOCAL_ORIGIN_FAILURE" | "SUCCESS_RATE_LOCAL_ORIGIN" | "FAILURE_PERCENTAGE" | "FAILURE_PERCENTAGE_LOCAL_ORIGIN"

#Action: "EJECT" | "UNEJECT"
