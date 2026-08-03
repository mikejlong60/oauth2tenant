// Code generated from envoy/service/load_stats/v2/lrs.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	endpoint_2 "envoyproxy.io/envoy-cue/spec/api/v2/endpoint"
)

#LoadStatsRequest: {
	"@type": "type.googleapis.com/envoy.service.load_stats.v2.LoadStatsRequest"
	node?:   core_1.#Node
	cluster_stats?: [...endpoint_2.#ClusterStats]
}

#LoadStatsResponse: {
	"@type": "type.googleapis.com/envoy.service.load_stats.v2.LoadStatsResponse"
	clusters?: [...string]
	send_all_clusters?:           bool
	load_reporting_interval?:     string
	report_endpoint_granularity?: bool
}
