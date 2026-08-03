// Code generated from envoy/extensions/load_balancing_policies/least_request/v3/least_request.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/load_balancing_policies/common/v3"
)

#LeastRequest: {
	"@type":              "type.googleapis.com/envoy.extensions.load_balancing_policies.least_request.v3.LeastRequest"
	choice_count?:        uint32 & >=2
	active_request_bias?: v3_1.#RuntimeDouble
	slow_start_config?:   v3_2.#SlowStartConfig
	locality_lb_config?:  v3_2.#LocalityLbConfig
	enable_full_scan?:    bool
	selection_method?:    #LeastRequest_SelectionMethod
}

#LeastRequest_SelectionMethod: "N_CHOICES" | "FULL_SCAN"
