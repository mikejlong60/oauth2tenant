// Code generated from envoy/extensions/load_balancing_policies/random_subsetting/v3/random_subsetting.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
)

#RandomSubsetting: {
	"@type":       "type.googleapis.com/envoy.extensions.load_balancing_policies.random_subsetting.v3.RandomSubsetting"
	subset_size?:  uint32 & >0
	child_policy!: v3_1.#LoadBalancingPolicy
}
