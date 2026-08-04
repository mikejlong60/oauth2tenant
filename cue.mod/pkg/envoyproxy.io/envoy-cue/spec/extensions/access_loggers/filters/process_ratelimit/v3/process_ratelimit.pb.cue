// Code generated from envoy/extensions/access_loggers/filters/process_ratelimit/v3/process_ratelimit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Filters for rate limiting the access log emission using global token buckets per process and shared across all listeners.
#ProcessRateLimitFilter: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.filters.process_ratelimit.v3.ProcessRateLimitFilter"

	// The dynamic config for the token bucket.
	dynamic_config?: #DynamicTokenBucket
}

#DynamicTokenBucket: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.filters.process_ratelimit.v3.DynamicTokenBucket"

	// the key used to find the token bucket in the singleton map.
	resource_name!: string & strings.MinRunes(1)

	// The configuration source for the :ref:`token_bucket <envoy_v3_api_msg_type.v3.TokenBucket>`.
	// It should stay the same through the process lifetime.
	config_source!: v3_1.#ConfigSource
}
