// Code generated from envoy/api/v2/endpoint.proto. DO NOT EDIT.
package v2

import (
	endpoint_1 "envoyproxy.io/envoy-cue/spec/api/v2/endpoint"
	type_2 "envoyproxy.io/envoy-cue/spec/type"
)

#ClusterLoadAssignment: {
	"@type":       "type.googleapis.com/envoy.api.v2.ClusterLoadAssignment"
	cluster_name!: string & !=""
	endpoints?: [...endpoint_1.#LocalityLbEndpoints]
	named_endpoints?: {[string]: endpoint_1.#Endpoint}
	policy?: #ClusterLoadAssignment_Policy
}

#ClusterLoadAssignment_Policy: {
	"@type": "type.googleapis.com/envoy.api.v2.ClusterLoadAssignment.Policy"
	drop_overloads?: [...#ClusterLoadAssignment_Policy_DropOverload]
	overprovisioning_factor?:  uint32 & >0
	endpoint_stale_after?:     string // TODO(pgv): duration bounds
	disable_overprovisioning?: bool
}

#ClusterLoadAssignment_Policy_DropOverload: {
	"@type":          "type.googleapis.com/envoy.api.v2.ClusterLoadAssignment.Policy.DropOverload"
	category!:        string & !=""
	drop_percentage?: type_2.#FractionalPercent
}
