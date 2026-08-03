// Code generated from envoy/extensions/load_balancing_policies/subset/v3/subset.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
)

#Subset: {
	"@type":          "type.googleapis.com/envoy.extensions.load_balancing_policies.subset.v3.Subset"
	fallback_policy?: #Subset_LbSubsetFallbackPolicy
	default_subset?: {...}
	subset_selectors?: [...#Subset_LbSubsetSelector]
	allow_redundant_keys?:     bool
	locality_weight_aware?:    bool
	scale_locality_weight?:    bool
	panic_mode_any?:           bool
	list_as_any?:              bool
	metadata_fallback_policy?: #Subset_LbSubsetMetadataFallbackPolicy
	subset_lb_policy!:         v3_1.#LoadBalancingPolicy
}

#Subset_LbSubsetSelector: {
	"@type": "type.googleapis.com/envoy.extensions.load_balancing_policies.subset.v3.Subset.LbSubsetSelector"
	keys?: [...string]
	single_host_per_subset?: bool
	fallback_policy?:        #Subset_LbSubsetSelector_LbSubsetSelectorFallbackPolicy
	fallback_keys_subset?: [...string]
}

#Subset_LbSubsetSelector_LbSubsetSelectorFallbackPolicy: "NOT_DEFINED" | "NO_FALLBACK" | "ANY_ENDPOINT" | "DEFAULT_SUBSET" | "KEYS_SUBSET"

#Subset_LbSubsetFallbackPolicy: "NO_FALLBACK" | "ANY_ENDPOINT" | "DEFAULT_SUBSET"

#Subset_LbSubsetMetadataFallbackPolicy: "METADATA_NO_FALLBACK" | "FALLBACK_LIST"
