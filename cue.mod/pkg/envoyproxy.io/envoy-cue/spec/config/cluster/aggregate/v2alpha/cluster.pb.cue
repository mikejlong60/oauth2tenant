// Code generated from envoy/config/cluster/aggregate/v2alpha/cluster.proto. DO NOT EDIT.
package v2alpha

import (
	"list"
)

#ClusterConfig: {
	"@type": "type.googleapis.com/envoy.config.cluster.aggregate.v2alpha.ClusterConfig"
	clusters!: [...string] & list.MinItems(1)
}
