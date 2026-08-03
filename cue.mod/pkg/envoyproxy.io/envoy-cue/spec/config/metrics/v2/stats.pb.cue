// Code generated from envoy/config/metrics/v2/stats.proto. DO NOT EDIT.
package v2

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_1 "envoyproxy.io/envoy-cue/spec/type/matcher"
)

#StatsSink: {
	"@type": "type.googleapis.com/envoy.config.metrics.v2.StatsSink"
	name?:   string
	config?: {...}
	typed_config?: {...}
}

#StatsConfig: {
	"@type": "type.googleapis.com/envoy.config.metrics.v2.StatsConfig"
	stats_tags?: [...#TagSpecifier]
	use_all_default_tags?: bool
	stats_matcher?:        #StatsMatcher
}

#StatsMatcher: {
	"@type":         "type.googleapis.com/envoy.config.metrics.v2.StatsMatcher"
	reject_all?:     bool
	exclusion_list?: matcher_1.#ListStringMatcher
	inclusion_list?: matcher_1.#ListStringMatcher
}

#TagSpecifier: {
	"@type":      "type.googleapis.com/envoy.config.metrics.v2.TagSpecifier"
	tag_name?:    string
	regex?:       string
	fixed_value?: string
}

#StatsdSink: {
	"@type":           "type.googleapis.com/envoy.config.metrics.v2.StatsdSink"
	address?:          core_2.#Address
	tcp_cluster_name?: string
	prefix?:           string
}

#DogStatsdSink: {
	"@type":  "type.googleapis.com/envoy.config.metrics.v2.DogStatsdSink"
	address?: core_2.#Address
	prefix?:  string
}

#HystrixSink: {
	"@type":      "type.googleapis.com/envoy.config.metrics.v2.HystrixSink"
	num_buckets?: int64
}
