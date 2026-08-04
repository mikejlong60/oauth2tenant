// Code generated from envoy/extensions/filters/http/adaptive_concurrency/v3/adaptive_concurrency.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Configuration parameters for the gradient controller.
#GradientControllerConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig"

	// The percentile to use when summarizing aggregated samples. Defaults to p50.
	sample_aggregate_percentile?: v3_1.#Percent
	concurrency_limit_params!:    #GradientControllerConfig_ConcurrencyLimitCalculationParams
	min_rtt_calc_params!:         #GradientControllerConfig_MinimumRTTCalculationParams
}

// Parameters controlling the periodic recalculation of the concurrency limit from sampled request
// latencies.
#GradientControllerConfig_ConcurrencyLimitCalculationParams: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig.ConcurrencyLimitCalculationParams"

	// The allowed upper-bound on the calculated concurrency limit. Defaults to 1000.
	max_concurrency_limit?: uint32 & >0

	// The period of time samples are taken to recalculate the concurrency limit.
	concurrency_update_interval!: string // TODO(pgv): duration bounds
}

// Parameters controlling the periodic minRTT recalculation.
// [#next-free-field: 7]
#GradientControllerConfig_MinimumRTTCalculationParams: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig.MinimumRTTCalculationParams"

	// The time interval between recalculating the minimum request round-trip time. Has to be
	// positive. If set to zero, dynamic sampling of the minRTT is disabled.
	interval?: string // TODO(pgv): duration bounds

	// The fixed value for the minRTT. This value is used when minRTT is not sampled dynamically.
	// If dynamic sampling of the minRTT is disabled, this field must be set.
	fixed_value?: string // TODO(pgv): duration bounds

	// The number of requests to aggregate/sample during the minRTT recalculation window before
	// updating. Defaults to 50.
	request_count?: uint32 & >0

	// Randomized time delta that will be introduced to the start of the minRTT calculation window.
	// This is represented as a percentage of the interval duration. Defaults to 15%.
	//
	// Example: If the interval is 10s and the jitter is 15%, the next window will begin
	// somewhere in the range (10s - 11.5s).
	jitter?: v3_1.#Percent

	// The concurrency limit set while measuring the minRTT. Defaults to 3.
	min_concurrency?: uint32 & >0

	// Amount added to the measured minRTT to add stability to the concurrency limit during natural
	// variability in latency. This is expressed as a percentage of the measured value and can be
	// adjusted to allow more or less tolerance to the sampled latency values.
	//
	// Defaults to 25%.
	buffer?: v3_1.#Percent
}

#AdaptiveConcurrency: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.AdaptiveConcurrency"

	// If set to false, the adaptive concurrency filter will operate as a pass-through filter. If the
	// message is unspecified, the filter will be enabled.
	enabled?: v3_2.#RuntimeFeatureFlag

	// This field allows for a custom HTTP response status code to the downstream client when
	// the concurrency limit has been exceeded.
	// Defaults to 503 (Service Unavailable).
	//
	// .. note::
	//   If this is set to < 400, 503 will be used instead.
	concurrency_limit_exceeded_status?: v3_1.#HttpStatus

	// oneof concurrency_controller_config: exactly one must be set
	// Gradient concurrency control will be used.
	{gradient_controller_config!: #GradientControllerConfig}
}
