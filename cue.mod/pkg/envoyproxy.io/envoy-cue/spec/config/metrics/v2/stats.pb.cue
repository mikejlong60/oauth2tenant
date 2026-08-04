// Code generated from envoy/config/metrics/v2/stats.proto. DO NOT EDIT.
package v2

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_1 "envoyproxy.io/envoy-cue/spec/type/matcher"
)

#StatsSink: {
	"@type": "type.googleapis.com/envoy.config.metrics.v2.StatsSink"
	name?:   string

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#StatsConfig: {
	"@type": "type.googleapis.com/envoy.config.metrics.v2.StatsConfig"
	stats_tags?: [...#TagSpecifier]
	use_all_default_tags?: bool
	stats_matcher?:        #StatsMatcher
}

#StatsMatcher: {
	"@type": "type.googleapis.com/envoy.config.metrics.v2.StatsMatcher"

	// oneof stats_matcher: exactly one must be set
	{reject_all!: bool} |
	{exclusion_list!: matcher_1.#ListStringMatcher} |
	{inclusion_list!: matcher_1.#ListStringMatcher}
}

#TagSpecifier: {
	"@type":   "type.googleapis.com/envoy.config.metrics.v2.TagSpecifier"
	tag_name?: string

	// oneof tag_value: at most one may be set
	*{} |
	{regex!: string} |
	{fixed_value!: string}
}

#StatsdSink: {
	"@type": "type.googleapis.com/envoy.config.metrics.v2.StatsdSink"
	prefix?: string

	// oneof statsd_specifier: exactly one must be set
	{address!: core_2.#Address} |
	{tcp_cluster_name!: string}
}

#DogStatsdSink: {
	"@type": "type.googleapis.com/envoy.config.metrics.v2.DogStatsdSink"
	prefix?: string

	// oneof dog_statsd_specifier: exactly one must be set
	{address!: core_2.#Address}
}

#HystrixSink: {
	"@type":      "type.googleapis.com/envoy.config.metrics.v2.HystrixSink"
	num_buckets?: int64
}
