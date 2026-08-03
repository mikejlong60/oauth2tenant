// Code generated from envoy/config/metrics/v3/stats.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#StatsSink: {
	"@type": "type.googleapis.com/envoy.config.metrics.v3.StatsSink"
	name?:   string
	typed_config?: {...}
}

#StatsConfig: {
	"@type": "type.googleapis.com/envoy.config.metrics.v3.StatsConfig"
	stats_tags?: [...#TagSpecifier]
	use_all_default_tags?: bool
	stats_matcher?:        #StatsMatcher
	histogram_bucket_settings?: [...#HistogramBucketSettings]
}

#StatsMatcher: {
	"@type":         "type.googleapis.com/envoy.config.metrics.v3.StatsMatcher"
	reject_all?:     bool
	exclusion_list?: v3_1.#ListStringMatcher
	inclusion_list?: v3_1.#ListStringMatcher
}

#TagSpecifier: {
	"@type":      "type.googleapis.com/envoy.config.metrics.v3.TagSpecifier"
	tag_name?:    string
	regex?:       string
	fixed_value?: string
}

#HistogramBucketSettings: {
	"@type": "type.googleapis.com/envoy.config.metrics.v3.HistogramBucketSettings"
	match!:  v3_1.#StringMatcher
	buckets?: [...float64] // TODO(pgv): repeated.unique
	bins?:                 uint32 & >0 & <=46082
}

#StatsdSink: {
	"@type":           "type.googleapis.com/envoy.config.metrics.v3.StatsdSink"
	address?:          v3_2.#Address
	tcp_cluster_name?: string
	prefix?:           string
}

#DogStatsdSink: {
	"@type":                 "type.googleapis.com/envoy.config.metrics.v3.DogStatsdSink"
	address?:                v3_2.#Address
	prefix?:                 string
	max_bytes_per_datagram?: uint64 & >0
}

#HystrixSink: {
	"@type":      "type.googleapis.com/envoy.config.metrics.v3.HystrixSink"
	num_buckets?: int64
}
