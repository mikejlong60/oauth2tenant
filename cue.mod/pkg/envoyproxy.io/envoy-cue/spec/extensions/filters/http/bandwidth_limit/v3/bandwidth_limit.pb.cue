// Code generated from envoy/extensions/filters/http/bandwidth_limit/v3/bandwidth_limit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// [#next-free-field: 8]
#BandwidthLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.bandwidth_limit.v3.BandwidthLimit"

	// The human readable prefix to use when emitting stats.
	stat_prefix!: string & strings.MinRunes(1)

	// The enable mode for the bandwidth limit filter.
	// Default is Disabled.
	enable_mode?: #BandwidthLimit_EnableMode

	// The limit supplied in KiB/s.
	//
	// .. note::
	//   It's fine for the limit to be unset for the global configuration since the bandwidth limit
	//   can be applied at a the virtual host or route level. Thus, the limit must be set for the
	//   per route configuration otherwise the config will be rejected.
	//
	// .. note::
	//   When using per route configuration, the limit becomes unique to that route.
	limit_kbps?: uint64 & >=1

	// Optional Fill interval in milliseconds for the token refills. Defaults to 50ms.
	// It must be at least 20ms to avoid too aggressive refills.
	fill_interval?: string // TODO(pgv): duration bounds

	// Runtime flag that controls whether the filter is enabled or not. If not specified, defaults
	// to enabled.
	runtime_enabled?: v3_1.#RuntimeFeatureFlag

	// Enable response trailers.
	//
	// .. note::
	//
	//   If set true, the following 4 trailers will be added, prefixed by ``response_trailer_prefix``:
	//   * bandwidth-request-delay-ms: delay time in milliseconds it took for the request stream transfer including request body transfer time and the time added by the filter.
	//   * bandwidth-response-delay-ms: delay time in milliseconds it took for the response stream transfer including response body transfer time and the time added by the filter.
	//   * bandwidth-request-filter-delay-ms: delay time in milliseconds in request stream transfer added by the filter.
	//   * bandwidth-response-filter-delay-ms: delay time in milliseconds that added by the filter.
	//   If :ref:`enable_mode <envoy_v3_api_field_extensions.filters.http.bandwidth_limit.v3.BandwidthLimit.enable_mode>` is ``DISABLED`` or ``REQUEST``, the trailers will not be set.
	//   If both the request and response delay time is 0, the trailers will not be set.
	enable_response_trailers?: bool

	// Optional The prefix for the response trailers.
	response_trailer_prefix?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

// Defines the mode for the bandwidth limit filter.
// Values represent bitmask.
#BandwidthLimit_EnableMode:
	// Filter is disabled.
	"DISABLED" |

	// Filter enabled only for incoming traffic.
	"REQUEST" |

	// Filter enabled only for outgoing traffic.
	"RESPONSE" |

	// Filter enabled for both incoming and outgoing traffic.
	"REQUEST_AND_RESPONSE"
