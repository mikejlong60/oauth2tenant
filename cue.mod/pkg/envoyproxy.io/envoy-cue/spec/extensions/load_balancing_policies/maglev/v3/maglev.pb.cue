// Code generated from envoy/extensions/load_balancing_policies/maglev/v3/maglev.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/load_balancing_policies/common/v3"
)

#Maglev: {
	"@type":                       "type.googleapis.com/envoy.extensions.load_balancing_policies.maglev.v3.Maglev"
	table_size?:                   uint64 & <=5000011
	consistent_hashing_lb_config?: v3_1.#ConsistentHashingLbConfig
	locality_weighted_lb_config?:  v3_1.#LocalityLbConfig_LocalityWeightedLbConfig
}
