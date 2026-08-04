// Code generated from envoy/extensions/common/ratelimit/v3/ratelimit.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

// A RateLimitDescriptor is a list of hierarchical entries that are used by the service to
// determine the final rate limit key and overall allowed limit. Here are some examples of how
// they might be used for the domain "envoy".
//
// .. code-block:: cpp
//
//   ["authenticated": "false"], ["remote_address": "10.0.0.1"]
//
// What it does: Limits all unauthenticated traffic for the IP address 10.0.0.1. The
// configuration supplies a default limit for the *remote_address* key. If there is a desire to
// raise the limit for 10.0.0.1 or block it entirely it can be specified directly in the
// configuration.
//
// .. code-block:: cpp
//
//   ["authenticated": "false"], ["path": "/foo/bar"]
//
// What it does: Limits all unauthenticated traffic globally for a specific path (or prefix if
// configured that way in the service).
//
// .. code-block:: cpp
//
//   ["authenticated": "false"], ["path": "/foo/bar"], ["remote_address": "10.0.0.1"]
//
// What it does: Limits unauthenticated traffic to a specific path for a specific IP address.
// Like (1) we can raise/block specific IP addresses if we want with an override configuration.
//
// .. code-block:: cpp
//
//   ["authenticated": "true"], ["client_id": "foo"]
//
// What it does: Limits all traffic for an authenticated client "foo"
//
// .. code-block:: cpp
//
//   ["authenticated": "true"], ["client_id": "foo"], ["path": "/foo/bar"]
//
// What it does: Limits traffic to a specific path for an authenticated client "foo"
//
// The idea behind the API is that (1)/(2)/(3) and (4)/(5) can be sent in 1 request if desired.
// This enables building complex application scenarios with a generic backend.
//
// Optionally the descriptor can contain a limit override under a "limit" key, that specifies
// the number of requests per unit to use instead of the number configured in the
// rate limiting service.
#RateLimitDescriptor: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.RateLimitDescriptor"

	// Descriptor entries.
	entries!: [...#RateLimitDescriptor_Entry] & list.MinItems(1)

	// Optional rate limit override to supply to the ratelimit service.
	limit?: #RateLimitDescriptor_RateLimitOverride

	// Optional hits_addend for the rate limit descriptor. If set the value will override the
	// request level hits_addend.
	hits_addend?: uint64
}

#RateLimitDescriptor_Entry: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.RateLimitDescriptor.Entry"

	// Descriptor key.
	key!: string & strings.MinRunes(1)

	// Descriptor value. Blank value is treated as wildcard to create dynamic token buckets for each unique value.
	// Blank Values as wild card is currently supported only with envoy server instance level HTTP local rate limiting
	// and will not work if HTTP local rate limiting is enabled per connection level.
	value?: string
}

// Override rate limit to apply to this descriptor instead of the limit
// configured in the rate limit service. See :ref:`rate limit override
// <config_http_filters_rate_limit_rate_limit_override>` for more information.
#RateLimitDescriptor_RateLimitOverride: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.RateLimitDescriptor.RateLimitOverride"

	// The number of requests per unit of time.
	requests_per_unit?: uint32

	// The unit of time.
	unit?: v3_1.#RateLimitUnit
}

// Configuration used to enable local rate limiting.
//
// .. note::
//   The ``LocalRateLimitDescriptor`` is used to configure a local rate limit rule with a token
//   bucket algorithm. The ``RateLimitDescriptor`` is used to represent a list of symbols that
//   are used to match against the rate limit rule.
#LocalRateLimitDescriptor: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.LocalRateLimitDescriptor"

	// Descriptor entries.
	entries!: [...#RateLimitDescriptor_Entry] & list.MinItems(1)

	// Token Bucket algorithm for local ratelimiting.
	token_bucket!: v3_1.#TokenBucket

	// Mark the descriptor as shadow. When the values is true, envoy allow requests to the backend.
	shadow_mode?: bool
}

// Configuration used to enable local cluster level rate limiting where the token buckets
// will be shared across all the Envoy instances in the local cluster.
// A share will be calculated based on the membership of the local cluster dynamically
// and the configuration. When the limiter refilling the token bucket, the share will be
// applied. By default, the token bucket will be shared evenly.
//
// See :ref:`local cluster name
// <envoy_v3_api_field_config.bootstrap.v3.ClusterManager.local_cluster_name>` for more context
// about local cluster.
#LocalClusterRateLimit: {
	"@type": "type.googleapis.com/envoy.extensions.common.ratelimit.v3.LocalClusterRateLimit"
}

// Defines the version of the standard to use for X-RateLimit headers.
#XRateLimitHeadersRFCVersion:
	// X-RateLimit headers disabled.
	"OFF" |

	// Use `draft RFC Version 03 <https://tools.ietf.org/id/draft-polli-ratelimit-headers-03.html>`_ where 3 headers will be added:
	//
	// * ``X-RateLimit-Limit`` - indicates the request-quota associated to the
	//   client in the current time-window followed by the description of the
	//   quota policy. The value is returned by the maximum tokens of the token bucket.
	// * ``X-RateLimit-Remaining`` - indicates the remaining requests in the
	//   current time-window. The value is returned by the remaining tokens in the token bucket.
	// * ``X-RateLimit-Reset`` - indicates the number of seconds until reset of
	//   the current time-window. The value is returned by the remaining fill interval of the token bucket.
	"DRAFT_VERSION_03"

#VhRateLimitsOptions:
	// Use the virtual host rate limits unless the route has a rate limit policy.
	"OVERRIDE" |

	// Use the virtual host rate limits even if the route has a rate limit policy.
	"INCLUDE" |

	// Ignore the virtual host rate limits even if the route does not have a rate limit policy.
	"IGNORE"
