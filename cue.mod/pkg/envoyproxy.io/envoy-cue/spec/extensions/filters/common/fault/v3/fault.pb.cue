// Code generated from envoy/extensions/filters/common/fault/v3/fault.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#FaultDelay: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultDelay"
	fixed_delay?:  string // TODO(pgv): duration bounds
	header_delay?: #FaultDelay_HeaderDelay
	percentage?:   v3_1.#FractionalPercent
}

#FaultDelay_HeaderDelay: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultDelay.HeaderDelay"
}

#FaultDelay_FaultDelayType: "FIXED"

#FaultRateLimit: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit"
	fixed_limit?:  #FaultRateLimit_FixedLimit
	header_limit?: #FaultRateLimit_HeaderLimit
	percentage?:   v3_1.#FractionalPercent
}

#FaultRateLimit_FixedLimit: {
	"@type":     "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit.FixedLimit"
	limit_kbps?: uint64 & >=1
}

#FaultRateLimit_HeaderLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit.HeaderLimit"
}
