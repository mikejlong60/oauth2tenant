// Code generated from envoy/config/endpoint/v3/load_report.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#UpstreamLocalityStats: {
	"@type":                     "type.googleapis.com/envoy.config.endpoint.v3.UpstreamLocalityStats"
	locality?:                   v3_1.#Locality
	total_successful_requests?:  uint64
	total_requests_in_progress?: uint64
	total_error_requests?:       uint64
	total_issued_requests?:      uint64
	total_active_connections?:   uint64
	total_new_connections?:      uint64
	total_fail_connections?:     uint64
	cpu_utilization?:            #UnnamedEndpointLoadMetricStats
	mem_utilization?:            #UnnamedEndpointLoadMetricStats
	application_utilization?:    #UnnamedEndpointLoadMetricStats
	load_metric_stats?: [...#EndpointLoadMetricStats]
	upstream_endpoint_stats?: [...#UpstreamEndpointStats]
	priority?: uint32
}

#UpstreamEndpointStats: {
	"@type":  "type.googleapis.com/envoy.config.endpoint.v3.UpstreamEndpointStats"
	address?: v3_1.#Address
	metadata?: {...}
	total_successful_requests?:  uint64
	total_requests_in_progress?: uint64
	total_error_requests?:       uint64
	total_issued_requests?:      uint64
	load_metric_stats?: [...#EndpointLoadMetricStats]
}

#EndpointLoadMetricStats: {
	"@type":                            "type.googleapis.com/envoy.config.endpoint.v3.EndpointLoadMetricStats"
	metric_name?:                       string
	num_requests_finished_with_metric?: uint64
	total_metric_value?:                float64
}

#UnnamedEndpointLoadMetricStats: {
	"@type":                            "type.googleapis.com/envoy.config.endpoint.v3.UnnamedEndpointLoadMetricStats"
	num_requests_finished_with_metric?: uint64
	total_metric_value?:                float64
}

#ClusterStats: {
	"@type":               "type.googleapis.com/envoy.config.endpoint.v3.ClusterStats"
	cluster_name!:         string & strings.MinRunes(1)
	cluster_service_name?: string
	upstream_locality_stats!: [...#UpstreamLocalityStats] & list.MinItems(1)
	total_dropped_requests?: uint64
	dropped_requests?: [...#ClusterStats_DroppedRequests]
	load_report_interval?: string
}

#ClusterStats_DroppedRequests: {
	"@type":        "type.googleapis.com/envoy.config.endpoint.v3.ClusterStats.DroppedRequests"
	category!:      string & strings.MinRunes(1)
	dropped_count?: uint64
}
