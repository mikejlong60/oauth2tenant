// Code generated from envoy/api/v2/cluster/circuit_breaker.proto. DO NOT EDIT.
package cluster

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_2 "envoyproxy.io/envoy-cue/spec/type"
)

#CircuitBreakers: {
	"@type": "type.googleapis.com/envoy.api.v2.cluster.CircuitBreakers"
	thresholds?: [...#CircuitBreakers_Thresholds]
}

#CircuitBreakers_Thresholds: {
	"@type":               "type.googleapis.com/envoy.api.v2.cluster.CircuitBreakers.Thresholds"
	priority?:             core_1.#RoutingPriority
	max_connections?:      uint32
	max_pending_requests?: uint32
	max_requests?:         uint32
	max_retries?:          uint32
	retry_budget?:         #CircuitBreakers_Thresholds_RetryBudget
	track_remaining?:      bool
	max_connection_pools?: uint32
}

#CircuitBreakers_Thresholds_RetryBudget: {
	"@type":                "type.googleapis.com/envoy.api.v2.cluster.CircuitBreakers.Thresholds.RetryBudget"
	budget_percent?:        type_2.#Percent
	min_retry_concurrency?: uint32
}
