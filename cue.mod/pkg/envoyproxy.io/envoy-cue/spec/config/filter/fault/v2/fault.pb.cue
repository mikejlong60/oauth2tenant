// Code generated from envoy/config/filter/fault/v2/fault.proto. DO NOT EDIT.
package v2

import (
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

// Delay specification is used to inject latency into the
// HTTP/gRPC/Mongo/Redis operation or delay proxying of TCP connections.
// [#next-free-field: 6]
#FaultDelay: {
	"@type": "type.googleapis.com/envoy.config.filter.fault.v2.FaultDelay"

	// Unused and deprecated. Will be removed in the next release.
	type?: #FaultDelay_FaultDelayType

	// The percentage of operations/connections/requests on which the delay will be injected.
	percentage?: type_1.#FractionalPercent

	// oneof fault_delay_secifier: exactly one must be set
	// TODO(pgv): fixed_delay.duration bounds
	// Add a fixed delay before forwarding the operation upstream. See
	// https://developers.google.com/protocol-buffers/docs/proto3#json for
	// the JSON/YAML Duration mapping. For HTTP/Mongo/Redis, the specified
	// delay will be injected before a new request/operation. For TCP
	// connections, the proxying of the connection upstream will be delayed
	// for the specified period. This is required if type is FIXED.
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
	"@type": "type.googleapis.com/envoy.config.filter.fault.v2.FaultDelay.HeaderDelay"
}

#FaultDelay_FaultDelayType:
	// Unused and deprecated.
	"FIXED"

// Describes a rate limit to be applied.
#FaultRateLimit: {
	"@type": "type.googleapis.com/envoy.config.filter.fault.v2.FaultRateLimit"

	// The percentage of operations/connections/requests on which the rate limit will be injected.
	percentage?: type_1.#FractionalPercent

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
	"@type": "type.googleapis.com/envoy.config.filter.fault.v2.FaultRateLimit.FixedLimit"

	// The limit supplied in KiB/s.
	limit_kbps?: uint64 & >=1
}

// Rate limits are controlled via an HTTP header (if applicable). See the
// :ref:`HTTP fault filter <config_http_filters_fault_injection_http_header>` documentation for
// more information.
#FaultRateLimit_HeaderLimit: {
	"@type": "type.googleapis.com/envoy.config.filter.fault.v2.FaultRateLimit.HeaderLimit"
}
