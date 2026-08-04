// Code generated from envoy/service/ratelimit/v2/rls.proto. DO NOT EDIT.
package v2

import (
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	ratelimit_1 "envoyproxy.io/envoy-cue/spec/api/v2/ratelimit"
)

// Main message for a rate limit request. The rate limit service is designed to be fully generic
// in the sense that it can operate on arbitrary hierarchical key/value pairs. The loaded
// configuration will parse the request and find the most specific limit to apply. In addition,
// a RateLimitRequest can contain multiple "descriptors" to limit on. When multiple descriptors
// are provided, the server will limit on *ALL* of them and return an OVER_LIMIT response if any
// of them are over limit. This enables more complex application level rate limiting scenarios
// if desired.
#RateLimitRequest: {
	"@type": "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitRequest"

	// All rate limit requests must specify a domain. This enables the configuration to be per
	// application without fear of overlap. E.g., "envoy".
	domain?: string

	// All rate limit requests must specify at least one RateLimitDescriptor. Each descriptor is
	// processed by the service (see below). If any of the descriptors are over limit, the entire
	// request is considered to be over limit.
	descriptors?: [...ratelimit_1.#RateLimitDescriptor]

	// Rate limit requests can optionally specify the number of hits a request adds to the matched
	// limit. If the value is not set in the message, a request increases the matched limit by 1.
	hits_addend?: uint32
}

// A response from a ShouldRateLimit call.
#RateLimitResponse: {
	"@type": "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitResponse"

	// The overall response code which takes into account all of the descriptors that were passed
	// in the RateLimitRequest message.
	overall_code?: #RateLimitResponse_Code

	// A list of DescriptorStatus messages which matches the length of the descriptor list passed
	// in the RateLimitRequest. This can be used by the caller to determine which individual
	// descriptors failed and/or what the currently configured limits are for all of them.
	statuses?: [...#RateLimitResponse_DescriptorStatus]

	// A list of headers to add to the response
	headers?: [...core_2.#HeaderValue]

	// A list of headers to add to the request when forwarded
	request_headers_to_add?: [...core_2.#HeaderValue]
}

// Defines an actual rate limit in terms of requests per unit of time and the unit itself.
#RateLimitResponse_RateLimit: {
	"@type": "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitResponse.RateLimit"

	// A name or description of this limit.
	name?: string

	// The number of requests per unit of time.
	requests_per_unit?: uint32

	// The unit of time.
	unit?: #RateLimitResponse_RateLimit_Unit
}

#RateLimitResponse_RateLimit_Unit:
	// The time unit is not known.
	"UNKNOWN" |

	// The time unit representing a second.
	"SECOND" |

	// The time unit representing a minute.
	"MINUTE" |

	// The time unit representing an hour.
	"HOUR" |

	// The time unit representing a day.
	"DAY"

#RateLimitResponse_DescriptorStatus: {
	"@type": "type.googleapis.com/envoy.service.ratelimit.v2.RateLimitResponse.DescriptorStatus"

	// The response code for an individual descriptor.
	code?: #RateLimitResponse_Code

	// The current limit as configured by the server. Useful for debugging, etc.
	current_limit?: #RateLimitResponse_RateLimit

	// The limit remaining in the current time unit.
	limit_remaining?: uint32
}

#RateLimitResponse_Code:
	// The response code is not known.
	"UNKNOWN" |

	// The response code to notify that the number of requests are under limit.
	"OK" |

	// The response code to notify that the number of requests are over limit.
	"OVER_LIMIT"
