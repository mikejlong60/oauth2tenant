// Code generated from envoy/extensions/filters/common/fault/v3/fault.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#FaultDelay: {
	"@type":     "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultDelay"
	percentage?: v3_1.#FractionalPercent

	// oneof fault_delay_secifier: exactly one must be set
	// TODO(pgv): fixed_delay.duration bounds
	{fixed_delay!: string} |
	{header_delay!: #FaultDelay_HeaderDelay}
}

#FaultDelay_HeaderDelay: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultDelay.HeaderDelay"
}

#FaultDelay_FaultDelayType: "FIXED"

#FaultRateLimit: {
	"@type":     "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit"
	percentage?: v3_1.#FractionalPercent

	// oneof limit_type: exactly one must be set
	{fixed_limit!: #FaultRateLimit_FixedLimit} |
	{header_limit!: #FaultRateLimit_HeaderLimit}
}

#FaultRateLimit_FixedLimit: {
	"@type":     "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit.FixedLimit"
	limit_kbps?: uint64 & >=1
}

#FaultRateLimit_HeaderLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit.HeaderLimit"
}
