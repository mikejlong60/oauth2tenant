// Code generated from envoy/extensions/filters/common/fault/v3/fault.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

// Delay specification is used to inject latency into the
// HTTP/Mongo operation.
// [#next-free-field: 6]
#FaultDelay: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultDelay"

	// The percentage of operations/connections/requests on which the delay will be injected.
	percentage?: v3_1.#FractionalPercent

	// oneof fault_delay_secifier: exactly one must be set
	// TODO(pgv): fixed_delay.duration bounds
	// Add a fixed delay before forwarding the operation upstream. See
	// https://developers.google.com/protocol-buffers/docs/proto3#json for
	// the JSON/YAML Duration mapping. For HTTP/Mongo, the specified
	// delay will be injected before a new request/operation.
	// This is required if type is FIXED.
	{fixed_delay!: string} |
	{

		// Fault delays are controlled via an HTTP header (if applicable).
		header_delay!: #FaultDelay_HeaderDelay
	}
}

// Fault delays are controlled via an HTTP header (if applicable). See the
// :ref:`HTTP fault filter <config_http_filters_fault_injection_http_header>` documentation for
// more information.
#FaultDelay_HeaderDelay: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultDelay.HeaderDelay"
}

#FaultDelay_FaultDelayType:
	// Unused and deprecated.
	"FIXED"

// Describes a rate limit to be applied.
#FaultRateLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit"

	// The percentage of operations/connections/requests on which the rate limit will be injected.
	percentage?: v3_1.#FractionalPercent

	// oneof limit_type: exactly one must be set
	// A fixed rate limit.
	{fixed_limit!: #FaultRateLimit_FixedLimit} |
	{

		// Rate limits are controlled via an HTTP header (if applicable).
		header_limit!: #FaultRateLimit_HeaderLimit
	}
}

// Describes a fixed/constant rate limit.
#FaultRateLimit_FixedLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit.FixedLimit"

	// The limit supplied in KiB/s.
	limit_kbps?: uint64 & >=1
}

// Rate limits are controlled via an HTTP header (if applicable). See the
// :ref:`HTTP fault filter <config_http_filters_fault_injection_http_header>` documentation for
// more information.
#FaultRateLimit_HeaderLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.fault.v3.FaultRateLimit.HeaderLimit"
}
