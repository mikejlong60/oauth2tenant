// Code generated from envoy/extensions/filters/http/ratelimit/v3/rate_limit.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/ratelimit/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

// [#next-free-field: 18]
#RateLimit: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ratelimit.v3.RateLimit"

	// The rate limit domain to use when calling the rate limit service.
	domain!: string & strings.MinRunes(1)

	// Specifies the rate limit configurations to be applied with the same
	// stage number. If not set, the default stage number is 0.
	//
	// .. note::
	//
	//  The filter supports a range of 0 - 10 inclusively for stage numbers.
	stage?: uint32 & <=10

	// The type of requests the filter should apply to. The supported
	// types are ``internal``, ``external`` or ``both``. A request is considered internal if
	// :ref:`x-envoy-internal<config_http_conn_man_headers_x-envoy-internal>` is set to true. If
	// :ref:`x-envoy-internal<config_http_conn_man_headers_x-envoy-internal>` is not set or false, a
	// request is considered external. The filter defaults to ``both``, and it will apply to all request
	// types.
	request_type!: string & ("internal" | "external" | "both" | "")

	// The timeout in milliseconds for the rate limit service RPC. If not
	// set, this defaults to 20ms. A value of 0 disables the timeout (infinite).
	timeout?: string

	// The filter's behaviour in case the rate limiting service does
	// not respond back. When it is set to true, Envoy will not allow traffic in case of
	// communication failure between rate limiting service and the proxy.
	failure_mode_deny?: bool

	// Specifies whether a ``RESOURCE_EXHAUSTED`` gRPC code must be returned instead
	// of the default ``UNAVAILABLE`` gRPC code for a rate limited gRPC call. The
	// HTTP code will be 200 for a gRPC response.
	rate_limited_as_resource_exhausted?: bool

	// Configuration for an external rate limit service provider. If not
	// specified, any calls to the rate limit service will immediately return
	// success.
	rate_limit_service!: v3_1.#RateLimitServiceConfig

	// Defines the standard version to use for X-RateLimit headers emitted by the filter:
	//
	// * ``X-RateLimit-Limit`` - indicates the request-quota associated to the
	//   client in the current time-window followed by the description of the
	//   quota policy. The values are returned by the rate limiting service in
	//   :ref:`current_limit<envoy_v3_api_field_service.ratelimit.v3.RateLimitResponse.DescriptorStatus.current_limit>`
	//   field. Example: ``10, 10;w=1;name="per-ip", 1000;w=3600``.
	// * ``X-RateLimit-Remaining`` - indicates the remaining requests in the
	//   current time-window. The values are returned by the rate limiting service
	//   in :ref:`limit_remaining<envoy_v3_api_field_service.ratelimit.v3.RateLimitResponse.DescriptorStatus.limit_remaining>`
	//   field.
	// * ``X-RateLimit-Reset`` - indicates the number of seconds until reset of
	//   the current time-window. The values are returned by the rate limiting service
	//   in :ref:`duration_until_reset<envoy_v3_api_field_service.ratelimit.v3.RateLimitResponse.DescriptorStatus.duration_until_reset>`
	//   field.
	//
	// In case rate limiting policy specifies more than one time window, the values
	// above represent the window that is closest to reaching its limit.
	//
	// For more information about the headers specification see selected version of
	// the `draft RFC <https://tools.ietf.org/id/draft-polli-ratelimit-headers-03.html>`_.
	//
	// Disabled by default.
	//
	// [#next-major-version: unify with local ratelimit, should use common.ratelimit.v3.XRateLimitHeadersRFCVersion instead.]
	enable_x_ratelimit_headers?: #RateLimit_XRateLimitHeadersRFCVersion

	// Disables emitting the :ref:`x-envoy-ratelimited<config_http_filters_router_x-envoy-ratelimited>` header
	// in case of rate limiting (i.e. 429 responses).
	// Having this header not present potentially makes the request retriable.
	disable_x_envoy_ratelimited_header?: bool

	// This field allows for a custom HTTP response status code to the downstream client when
	// the request has been rate limited.
	// Defaults to 429 (TooManyRequests).
	//
	// .. note::
	//   If this is set to < 400, 429 will be used instead.
	rate_limited_status?: v3_2.#HttpStatus

	// Specifies a list of HTTP headers that should be added to each response for requests that
	// have been rate limited.
	response_headers_to_add?: [...v3_3.#HeaderValueOption] & list.MaxItems(10)

	// Sets the HTTP status that is returned to the client when the ratelimit server returns an error
	// or cannot be reached. The default status is 500.
	status_on_error?: v3_2.#HttpStatus

	// Optional additional prefix to use when emitting statistics. This allows to distinguish
	// emitted statistics between configured ``ratelimit`` filters in an HTTP filter chain.
	stat_prefix?: string

	// If set, this will enable -- but not necessarily enforce -- the rate limit for the given
	// fraction of requests.
	//
	// If not set then ``ratelimit.http_filter_enabled`` runtime key will be used to determine
	// the fraction of requests to enforce rate limits on. And the default percentage of the
	// runtime key is 100% for backwards compatibility.
	filter_enabled?: v3_3.#RuntimeFractionalPercent

	// If set, this will enforce the rate limit decisions for the given fraction of requests.
	//
	// Note: this only applies to the fraction of enabled requests.
	//
	// If not set then ``ratelimit.http_filter_enforcing`` runtime key will be used to determine
	// the fraction of requests to enforce rate limits on. And the default percentage of the
	// runtime key is 100% for backwards compatibility.
	filter_enforced?: v3_3.#RuntimeFractionalPercent

	// If set, this will override the failure_mode_deny parameter with a runtime fraction.
	// If the runtime key is not specified, the value of failure_mode_deny will be used.
	//
	// Example:
	//
	// .. code-block:: yaml
	//
	//   failure_mode_deny: true
	//   failure_mode_deny_percent:
	//     default_value:
	//       numerator: 50
	//       denominator: HUNDRED
	//     runtime_key: ratelimit.failure_mode_deny_percent
	//
	// This means that when the rate limit service is unavailable, 50% of requests will be denied
	// (fail closed) and 50% will be allowed (fail open).
	failure_mode_deny_percent?: v3_3.#RuntimeFractionalPercent

	// Rate limit configuration that is used to generate a list of descriptor entries based on
	// the request context. The generated entries will be sent to the rate limit service.
	// If this is set, then
	// :ref:`VirtualHost.rate_limits<envoy_v3_api_field_config.route.v3.VirtualHost.rate_limits>` or
	// :ref:`RouteAction.rate_limits<envoy_v3_api_field_config.route.v3.RouteAction.rate_limits>` fields
	// will be ignored. However, :ref:`RateLimitPerRoute.rate_limits<envoy_v3_api_field_extensions.filters.http.ratelimit.v3.RateLimitPerRoute.rate_limits>`
	// will take precedence over this field.
	//
	// .. note::
	//   Not all configuration fields of
	//   :ref:`rate limit config <envoy_v3_api_msg_config.route.v3.RateLimit>` is supported at here.
	//   Following fields are not supported:
	//
	//   1. :ref:`rate limit stage <envoy_v3_api_field_config.route.v3.RateLimit.stage>`.
	//   2. :ref:`dynamic metadata <envoy_v3_api_field_config.route.v3.RateLimit.Action.dynamic_metadata>`.
	//   3. :ref:`disable_key <envoy_v3_api_field_config.route.v3.RateLimit.disable_key>`.
	//   4. :ref:`override limit <envoy_v3_api_field_config.route.v3.RateLimit.limit>`.
	rate_limits?: [...v3_4.#RateLimit]
}

// Defines the version of the standard to use for X-RateLimit headers.
//
// [#next-major-version: unify with local ratelimit, should use common.ratelimit.v3.XRateLimitHeadersRFCVersion instead.]
#RateLimit_XRateLimitHeadersRFCVersion:
	// X-RateLimit headers disabled.
	"OFF" |

	// Use `draft RFC Version 03 <https://tools.ietf.org/id/draft-polli-ratelimit-headers-03.html>`_.
	"DRAFT_VERSION_03"

#RateLimitPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ratelimit.v3.RateLimitPerRoute"

	// Specifies if the rate limit filter should include the virtual host rate limits.
	// [#next-major-version: unify with local ratelimit, should use common.ratelimit.v3.VhRateLimitsOptions instead.]
	vh_rate_limits?: #RateLimitPerRoute_VhRateLimitsOptions

	// Specifies if the rate limit filter should include the lower levels (route level, virtual host level or cluster weight level) rate limits override options.
	// [#not-implemented-hide:]
	override_option?: #RateLimitPerRoute_OverrideOptions

	// Rate limit configuration that is used to generate a list of descriptor entries based on
	// the request context. The generated entries will be used to find one or multiple matched rate
	// limit rule from the ``descriptors``.
	// If this is set, then
	// :ref:`VirtualHost.rate_limits<envoy_v3_api_field_config.route.v3.VirtualHost.rate_limits>`,
	// :ref:`RouteAction.rate_limits<envoy_v3_api_field_config.route.v3.RouteAction.rate_limits>` and
	// :ref:`RateLimit.rate_limits<envoy_v3_api_field_extensions.filters.http.ratelimit.v3.RateLimit.rate_limits>` fields
	// will be ignored.
	//
	// .. note::
	//   Not all configuration fields of
	//   :ref:`rate limit config <envoy_v3_api_msg_config.route.v3.RateLimit>` is supported at here.
	//   Following fields are not supported:
	//
	//   1. :ref:`rate limit stage <envoy_v3_api_field_config.route.v3.RateLimit.stage>`.
	//   2. :ref:`dynamic metadata <envoy_v3_api_field_config.route.v3.RateLimit.Action.dynamic_metadata>`.
	//   3. :ref:`disable_key <envoy_v3_api_field_config.route.v3.RateLimit.disable_key>`.
	//   4. :ref:`override limit <envoy_v3_api_field_config.route.v3.RateLimit.limit>`.
	rate_limits?: [...v3_4.#RateLimit]

	// Overrides the domain. If not set, uses the filter-level domain instead.
	domain?: string
}

// [#next-major-version: unify with local ratelimit, should use common.ratelimit.v3.VhRateLimitsOptions instead.]
#RateLimitPerRoute_VhRateLimitsOptions:
	// Use the virtual host rate limits unless the route has a rate limit policy.
	"OVERRIDE" |

	// Use the virtual host rate limits even if the route has a rate limit policy.
	"INCLUDE" |

	// Ignore the virtual host rate limits even if the route does not have a rate limit policy.
	"IGNORE"

// The override option determines how the filter handles the cases where there is an override config at a more specific level than this one (from least to most specific: virtual host, route, cluster weight).
// [#not-implemented-hide:]
#RateLimitPerRoute_OverrideOptions:
	// Client-defined default, typically OVERRIDE_POLICY. If VhRateLimitsOptions is set, that will be used instead.
	"DEFAULT" |

	// If there is an override config at a more specific level, use that instead of this one.
	"OVERRIDE_POLICY" |

	// If there is an override config at a more specific level, use data from both.
	"INCLUDE_POLICY" |

	// If there is an override config at a more specific level, ignore it and use only this one.
	"IGNORE_POLICY"
