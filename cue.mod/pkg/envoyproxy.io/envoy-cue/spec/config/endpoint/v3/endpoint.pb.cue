// Code generated from envoy/config/endpoint/v3/endpoint.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#ClusterLoadAssignment: {
	"@type":       "type.googleapis.com/envoy.config.endpoint.v3.ClusterLoadAssignment"
	cluster_name!: string & strings.MinRunes(1)
	endpoints?: [...#LocalityLbEndpoints]
	named_endpoints?: {[string]: #Endpoint}
	policy?: #ClusterLoadAssignment_Policy
}

#ClusterLoadAssignment_Policy: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.ClusterLoadAssignment.Policy"
	drop_overloads?: [...#ClusterLoadAssignment_Policy_DropOverload]
	overprovisioning_factor?:  uint32 & >0
	endpoint_stale_after?:     string // TODO(pgv): duration bounds
	weighted_priority_health?: bool
}

#ClusterLoadAssignment_Policy_DropOverload: {
	"@type":          "type.googleapis.com/envoy.config.endpoint.v3.ClusterLoadAssignment.Policy.DropOverload"
	category!:        string & strings.MinRunes(1)
	drop_percentage?: v3_1.#FractionalPercent
}
