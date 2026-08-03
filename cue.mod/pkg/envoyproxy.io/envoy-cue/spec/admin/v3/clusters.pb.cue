// Code generated from envoy/admin/v3/clusters.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Clusters: {
	"@type": "type.googleapis.com/envoy.admin.v3.Clusters"
	cluster_statuses?: [...#ClusterStatus]
}

#ClusterStatus: {
	"@type":                          "type.googleapis.com/envoy.admin.v3.ClusterStatus"
	name?:                            string
	added_via_api?:                   bool
	success_rate_ejection_threshold?: v3_1.#Percent
	host_statuses?: [...#HostStatus]
	local_origin_success_rate_ejection_threshold?: v3_1.#Percent
	circuit_breakers?:                             v3_2.#CircuitBreakers
	observability_name?:                           string
	eds_service_name?:                             string
}

#HostStatus: {
	"@type":  "type.googleapis.com/envoy.admin.v3.HostStatus"
	address?: v3_3.#Address
	stats?: [...#SimpleMetric]
	health_status?:             #HostHealthStatus
	success_rate?:              v3_1.#Percent
	weight?:                    uint32
	hostname?:                  string
	priority?:                  uint32
	local_origin_success_rate?: v3_1.#Percent
	locality?:                  v3_3.#Locality
}

#HostHealthStatus: {
	"@type":                         "type.googleapis.com/envoy.admin.v3.HostHealthStatus"
	failed_active_health_check?:     bool
	failed_outlier_check?:           bool
	failed_active_degraded_check?:   bool
	pending_dynamic_removal?:        bool
	pending_active_hc?:              bool
	excluded_via_immediate_hc_fail?: bool
	active_hc_timeout?:              bool
	eds_health_status?:              v3_3.#HealthStatus
}
