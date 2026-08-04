// Code generated from envoy/config/filter/http/adaptive_concurrency/v2alpha/adaptive_concurrency.proto. DO NOT EDIT.
package v2alpha

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#GradientControllerConfig: {
	"@type":                      "type.googleapis.com/envoy.config.filter.http.adaptive_concurrency.v2alpha.GradientControllerConfig"
	sample_aggregate_percentile?: type_1.#Percent
	concurrency_limit_params!:    #GradientControllerConfig_ConcurrencyLimitCalculationParams
	min_rtt_calc_params!:         #GradientControllerConfig_MinimumRTTCalculationParams
}

#GradientControllerConfig_ConcurrencyLimitCalculationParams: {
	"@type":                      "type.googleapis.com/envoy.config.filter.http.adaptive_concurrency.v2alpha.GradientControllerConfig.ConcurrencyLimitCalculationParams"
	max_concurrency_limit?:       uint32 & >0
	concurrency_update_interval!: string // TODO(pgv): duration bounds
}

#GradientControllerConfig_MinimumRTTCalculationParams: {
	"@type":          "type.googleapis.com/envoy.config.filter.http.adaptive_concurrency.v2alpha.GradientControllerConfig.MinimumRTTCalculationParams"
	interval!:        string // TODO(pgv): duration bounds
	request_count?:   uint32 & >0
	jitter?:          type_1.#Percent
	min_concurrency?: uint32 & >0
	buffer?:          type_1.#Percent
}

#AdaptiveConcurrency: {
	"@type":  "type.googleapis.com/envoy.config.filter.http.adaptive_concurrency.v2alpha.AdaptiveConcurrency"
	enabled?: core_2.#RuntimeFeatureFlag

	// oneof concurrency_controller_config: exactly one must be set
	{gradient_controller_config!: #GradientControllerConfig}
}
