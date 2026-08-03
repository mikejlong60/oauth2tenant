// Code generated from envoy/config/cluster/v3/circuit_breaker.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#CircuitBreakers: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.CircuitBreakers"
	thresholds?: [...#CircuitBreakers_Thresholds]
	per_host_thresholds?: [...#CircuitBreakers_Thresholds]
}

#CircuitBreakers_Thresholds: {
	"@type":               "type.googleapis.com/envoy.config.cluster.v3.CircuitBreakers.Thresholds"
	priority?:             v3_1.#RoutingPriority
	max_connections?:      uint32
	max_pending_requests?: uint32
	max_requests?:         uint32
	max_retries?:          uint32
	retry_budget?:         #CircuitBreakers_Thresholds_RetryBudget
	track_remaining?:      bool
	max_connection_pools?: uint32
}

#CircuitBreakers_Thresholds_RetryBudget: {
	"@type":                "type.googleapis.com/envoy.config.cluster.v3.CircuitBreakers.Thresholds.RetryBudget"
	budget_percent?:        v3_2.#Percent
	min_retry_concurrency?: uint32
}
