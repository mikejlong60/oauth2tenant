// Code generated from envoy/extensions/clusters/composite/v3/cluster.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#ClusterConfig: {
	"@type": "type.googleapis.com/envoy.extensions.clusters.composite.v3.ClusterConfig"
	clusters!: [...#ClusterConfig_ClusterEntry] & list.MinItems(1)
}

#ClusterConfig_ClusterEntry: {
	"@type": "type.googleapis.com/envoy.extensions.clusters.composite.v3.ClusterConfig.ClusterEntry"
	name!:   string & strings.MinRunes(1)
}
