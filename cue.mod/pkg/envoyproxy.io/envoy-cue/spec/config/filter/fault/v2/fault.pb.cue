// Code generated from envoy/config/filter/fault/v2/fault.proto. DO NOT EDIT.
package v2

import (
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#FaultDelay: {
	"@type":     "type.googleapis.com/envoy.config.filter.fault.v2.FaultDelay"
	type?:       #FaultDelay_FaultDelayType
	percentage?: type_1.#FractionalPercent

	// oneof fault_delay_secifier: exactly one must be set
	// TODO(pgv): fixed_delay.duration bounds
	{fixed_delay!: string} |
	{header_delay!: #FaultDelay_HeaderDelay}
}

#FaultDelay_HeaderDelay: {
	"@type": "type.googleapis.com/envoy.config.filter.fault.v2.FaultDelay.HeaderDelay"
}

#FaultDelay_FaultDelayType: "FIXED"

#FaultRateLimit: {
	"@type":     "type.googleapis.com/envoy.config.filter.fault.v2.FaultRateLimit"
	percentage?: type_1.#FractionalPercent

	// oneof limit_type: exactly one must be set
	{fixed_limit!: #FaultRateLimit_FixedLimit} |
	{header_limit!: #FaultRateLimit_HeaderLimit}
}

#FaultRateLimit_FixedLimit: {
	"@type":     "type.googleapis.com/envoy.config.filter.fault.v2.FaultRateLimit.FixedLimit"
	limit_kbps?: uint64 & >=1
}

#FaultRateLimit_HeaderLimit: {
	"@type": "type.googleapis.com/envoy.config.filter.fault.v2.FaultRateLimit.HeaderLimit"
}
