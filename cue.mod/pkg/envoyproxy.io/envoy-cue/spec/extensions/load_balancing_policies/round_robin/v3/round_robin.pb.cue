// Code generated from envoy/extensions/load_balancing_policies/round_robin/v3/round_robin.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/load_balancing_policies/common/v3"
)

#RoundRobin: {
	"@type":             "type.googleapis.com/envoy.extensions.load_balancing_policies.round_robin.v3.RoundRobin"
	slow_start_config?:  v3_1.#SlowStartConfig
	locality_lb_config?: v3_1.#LocalityLbConfig
}
