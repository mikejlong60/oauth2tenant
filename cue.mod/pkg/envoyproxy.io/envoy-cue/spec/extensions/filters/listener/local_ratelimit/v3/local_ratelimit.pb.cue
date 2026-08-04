// Code generated from envoy/extensions/filters/listener/local_ratelimit/v3/local_ratelimit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#LocalRateLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.listener.local_ratelimit.v3.LocalRateLimit"

	// The prefix to use when emitting :ref:`statistics
	// <config_listener_filters_local_rate_limit_stats>`.
	stat_prefix!: string & strings.MinRunes(1)

	// The token bucket configuration to use for rate limiting all incoming sockets. If the token is available,
	// the socket will be allowed. If no tokens are available, the socket will be immediately closed.
	//
	// .. note::
	//   In the current implementation the token bucket's :ref:`fill_interval
	//   <envoy_v3_api_field_type.v3.TokenBucket.fill_interval>` must be >= 50ms to avoid too aggressive
	//   refills.
	token_bucket!: v3_1.#TokenBucket

	// Runtime flag that controls whether the filter is enabled or not. If not specified, defaults
	// to enabled.
	runtime_enabled?: v3_2.#RuntimeFeatureFlag
}
