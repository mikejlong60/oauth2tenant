// Code generated from envoy/api/v2/endpoint/load_report.proto. DO NOT EDIT.
package endpoint

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#UpstreamLocalityStats: {
	"@type":                     "type.googleapis.com/envoy.api.v2.endpoint.UpstreamLocalityStats"
	locality?:                   core_1.#Locality
	total_successful_requests?:  uint64
	total_requests_in_progress?: uint64
	total_error_requests?:       uint64
	total_issued_requests?:      uint64
	load_metric_stats?: [...#EndpointLoadMetricStats]
	upstream_endpoint_stats?: [...#UpstreamEndpointStats]
	priority?: uint32
}

#UpstreamEndpointStats: {
	"@type":  "type.googleapis.com/envoy.api.v2.endpoint.UpstreamEndpointStats"
	address?: core_1.#Address
	metadata?: {...}
	total_successful_requests?:  uint64
	total_requests_in_progress?: uint64
	total_error_requests?:       uint64
	total_issued_requests?:      uint64
	load_metric_stats?: [...#EndpointLoadMetricStats]
}

#EndpointLoadMetricStats: {
	"@type":                            "type.googleapis.com/envoy.api.v2.endpoint.EndpointLoadMetricStats"
	metric_name?:                       string
	num_requests_finished_with_metric?: uint64
	total_metric_value?:                float64
}

#ClusterStats: {
	"@type":               "type.googleapis.com/envoy.api.v2.endpoint.ClusterStats"
	cluster_name!:         string & !=""
	cluster_service_name?: string
	upstream_locality_stats!: [...#UpstreamLocalityStats] & list.MinItems(1)
	total_dropped_requests?: uint64
	dropped_requests?: [...#ClusterStats_DroppedRequests]
	load_report_interval?: string
}

#ClusterStats_DroppedRequests: {
	"@type":        "type.googleapis.com/envoy.api.v2.endpoint.ClusterStats.DroppedRequests"
	category!:      string & !=""
	dropped_count?: uint64
}
