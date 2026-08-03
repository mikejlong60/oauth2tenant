// Code generated from envoy/admin/v2alpha/clusters.proto. DO NOT EDIT.
package v2alpha

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#Clusters: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.Clusters"
	cluster_statuses?: [...#ClusterStatus]
}

#ClusterStatus: {
	"@type":                          "type.googleapis.com/envoy.admin.v2alpha.ClusterStatus"
	name?:                            string
	added_via_api?:                   bool
	success_rate_ejection_threshold?: type_1.#Percent
	host_statuses?: [...#HostStatus]
	local_origin_success_rate_ejection_threshold?: type_1.#Percent
}

#HostStatus: {
	"@type":  "type.googleapis.com/envoy.admin.v2alpha.HostStatus"
	address?: core_2.#Address
	stats?: [...#SimpleMetric]
	health_status?:             #HostHealthStatus
	success_rate?:              type_1.#Percent
	weight?:                    uint32
	hostname?:                  string
	priority?:                  uint32
	local_origin_success_rate?: type_1.#Percent
	locality?:                  core_2.#Locality
}

#HostHealthStatus: {
	"@type":                       "type.googleapis.com/envoy.admin.v2alpha.HostHealthStatus"
	failed_active_health_check?:   bool
	failed_outlier_check?:         bool
	failed_active_degraded_check?: bool
	pending_dynamic_removal?:      bool
	pending_active_hc?:            bool
	eds_health_status?:            core_2.#HealthStatus
}
