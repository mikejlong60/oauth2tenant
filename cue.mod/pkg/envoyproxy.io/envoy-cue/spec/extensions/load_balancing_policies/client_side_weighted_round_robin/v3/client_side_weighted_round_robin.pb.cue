// Code generated from envoy/extensions/load_balancing_policies/client_side_weighted_round_robin/v3/client_side_weighted_round_robin.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/load_balancing_policies/common/v3"
)

#ClientSideWeightedRoundRobin: {
	"@type":                    "type.googleapis.com/envoy.extensions.load_balancing_policies.client_side_weighted_round_robin.v3.ClientSideWeightedRoundRobin"
	enable_oob_load_report?:    bool
	oob_reporting_period?:      string
	blackout_period?:           string
	weight_expiration_period?:  string
	weight_update_period?:      string
	error_utilization_penalty?: float32 & >=0
	metric_names_for_computing_utilization?: [...string]
	slow_start_config?: v3_1.#SlowStartConfig
}
