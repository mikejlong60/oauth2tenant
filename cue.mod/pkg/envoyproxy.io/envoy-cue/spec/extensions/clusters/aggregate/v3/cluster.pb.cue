// Code generated from envoy/extensions/clusters/aggregate/v3/cluster.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ClusterConfig: {
	"@type": "type.googleapis.com/envoy.extensions.clusters.aggregate.v3.ClusterConfig"
	clusters!: [...string] & list.MinItems(1)
}

#AggregateClusterResource: {
	"@type":        "type.googleapis.com/envoy.extensions.clusters.aggregate.v3.AggregateClusterResource"
	config_source!: v3_1.#ConfigSource
	resource_name!: string & strings.MinRunes(1)
}
