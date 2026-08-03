// Code generated from envoy/extensions/load_balancing_policies/common/v3/common.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#LocalityLbConfig: {
	"@type":                      "type.googleapis.com/envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig"
	zone_aware_lb_config?:        #LocalityLbConfig_ZoneAwareLbConfig
	locality_weighted_lb_config?: #LocalityLbConfig_LocalityWeightedLbConfig
}

#LocalityLbConfig_ZoneAwareLbConfig: {
	"@type":                        "type.googleapis.com/envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig.ZoneAwareLbConfig"
	routing_enabled?:               v3_1.#Percent
	min_cluster_size?:              uint64
	fail_traffic_on_panic?:         bool
	force_locality_direct_routing?: bool
	force_local_zone?:              #LocalityLbConfig_ZoneAwareLbConfig_ForceLocalZone
	locality_basis?:                #LocalityLbConfig_ZoneAwareLbConfig_LocalityBasis
}

#LocalityLbConfig_ZoneAwareLbConfig_ForceLocalZone: {
	"@type":   "type.googleapis.com/envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig.ZoneAwareLbConfig.ForceLocalZone"
	min_size?: uint32
}

#LocalityLbConfig_ZoneAwareLbConfig_LocalityBasis: "HEALTHY_HOSTS_NUM" | "HEALTHY_HOSTS_WEIGHT"

#LocalityLbConfig_LocalityWeightedLbConfig: {
	"@type": "type.googleapis.com/envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig.LocalityWeightedLbConfig"
}

#SlowStartConfig: {
	"@type":             "type.googleapis.com/envoy.extensions.load_balancing_policies.common.v3.SlowStartConfig"
	slow_start_window?:  string
	aggression?:         v3_2.#RuntimeDouble
	min_weight_percent?: v3_1.#Percent
}

#ConsistentHashingLbConfig: {
	"@type":                   "type.googleapis.com/envoy.extensions.load_balancing_policies.common.v3.ConsistentHashingLbConfig"
	use_hostname_for_hashing?: bool
	hash_balance_factor?:      uint32 & >=100
	hash_policy?: [...v3_3.#RouteAction_HashPolicy]
}
