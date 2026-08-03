// Code generated from envoy/extensions/load_balancing_policies/ring_hash/v3/ring_hash.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/load_balancing_policies/common/v3"
)

#RingHash: {
	"@type":                       "type.googleapis.com/envoy.extensions.load_balancing_policies.ring_hash.v3.RingHash"
	hash_function?:                #RingHash_HashFunction
	minimum_ring_size?:            uint64 & >=1 & <=8388608
	maximum_ring_size?:            uint64 & <=8388608
	use_hostname_for_hashing?:     bool
	hash_balance_factor?:          uint32 & >=100
	consistent_hashing_lb_config?: v3_1.#ConsistentHashingLbConfig
	locality_weighted_lb_config?:  v3_1.#LocalityLbConfig_LocalityWeightedLbConfig
}

#RingHash_HashFunction: "DEFAULT_HASH" | "XX_HASH" | "MURMUR_HASH_2"
