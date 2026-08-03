// Code generated from envoy/extensions/filters/http/adaptive_concurrency/v3/adaptive_concurrency.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#GradientControllerConfig: {
	"@type":                      "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig"
	sample_aggregate_percentile?: v3_1.#Percent
	concurrency_limit_params!:    #GradientControllerConfig_ConcurrencyLimitCalculationParams
	min_rtt_calc_params!:         #GradientControllerConfig_MinimumRTTCalculationParams
}

#GradientControllerConfig_ConcurrencyLimitCalculationParams: {
	"@type":                      "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig.ConcurrencyLimitCalculationParams"
	max_concurrency_limit?:       uint32 & >0
	concurrency_update_interval!: string // TODO(pgv): duration bounds
}

#GradientControllerConfig_MinimumRTTCalculationParams: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig.MinimumRTTCalculationParams"
	interval?:        string // TODO(pgv): duration bounds
	fixed_value?:     string // TODO(pgv): duration bounds
	request_count?:   uint32 & >0
	jitter?:          v3_1.#Percent
	min_concurrency?: uint32 & >0
	buffer?:          v3_1.#Percent
}

#AdaptiveConcurrency: {
	"@type":                            "type.googleapis.com/envoy.extensions.filters.http.adaptive_concurrency.v3.AdaptiveConcurrency"
	gradient_controller_config!:        #GradientControllerConfig
	enabled?:                           v3_2.#RuntimeFeatureFlag
	concurrency_limit_exceeded_status?: v3_1.#HttpStatus
}
