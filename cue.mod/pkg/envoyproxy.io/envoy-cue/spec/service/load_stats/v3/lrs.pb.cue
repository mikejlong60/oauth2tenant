// Code generated from envoy/service/load_stats/v3/lrs.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/endpoint/v3"
)

#LoadStatsRequest: {
	"@type": "type.googleapis.com/envoy.service.load_stats.v3.LoadStatsRequest"
	node?:   v3_1.#Node
	cluster_stats?: [...v3_2.#ClusterStats]
}

#LoadStatsResponse: {
	"@type": "type.googleapis.com/envoy.service.load_stats.v3.LoadStatsResponse"
	clusters?: [...string]
	send_all_clusters?:           bool
	load_reporting_interval?:     string
	report_endpoint_granularity?: bool
}
