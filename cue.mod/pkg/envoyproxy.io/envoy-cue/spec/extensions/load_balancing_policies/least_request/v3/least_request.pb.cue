// Code generated from envoy/extensions/load_balancing_policies/least_request/v3/least_request.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/load_balancing_policies/common/v3"
)

// This configuration allows the built-in LEAST_REQUEST LB policy to be configured via the LB policy
// extension point. See the :ref:`load balancing architecture overview
// <arch_overview_load_balancing_types>` for more information.
// [#next-free-field: 7]
#LeastRequest: {
	"@type": "type.googleapis.com/envoy.extensions.load_balancing_policies.least_request.v3.LeastRequest"

	// The number of random healthy hosts from which the host with the fewest active requests will
	// be chosen. Defaults to 2 so that we perform two-choice selection if the field is not set.
	// Only applies to the ``N_CHOICES`` selection method.
	choice_count?: uint32 & >=2

	// The following formula is used to calculate the dynamic weights when hosts have different load
	// balancing weights:
	//
	// ``weight = load_balancing_weight / (active_requests + 1)^active_request_bias``
	//
	// The larger the active request bias is, the more aggressively active requests will lower the
	// effective weight when all host weights are not equal.
	//
	// ``active_request_bias`` must be greater than or equal to 0.0.
	//
	// When ``active_request_bias == 0.0`` the Least Request Load Balancer doesn't consider the number
	// of active requests at the time it picks a host and behaves like the Round Robin Load
	// Balancer.
	//
	// When ``active_request_bias > 0.0`` the Least Request Load Balancer scales the load balancing
	// weight by the number of active requests at the time it does a pick.
	//
	// The value is cached for performance reasons and refreshed whenever one of the Load Balancer's
	// host sets changes, e.g., whenever there is a host membership update or a host load balancing
	// weight change.
	//
	// .. note::
	//   This setting only takes effect if all host weights are not equal.
	active_request_bias?: v3_1.#RuntimeDouble

	// Configuration for slow start mode.
	// If this configuration is not set, slow start will not be not enabled.
	slow_start_config?: v3_2.#SlowStartConfig

	// Configuration for local zone aware load balancing or locality weighted load balancing.
	locality_lb_config?: v3_2.#LocalityLbConfig

	// [#not-implemented-hide:]
	// Unused. Replaced by the `selection_method` enum for better extensibility.
	enable_full_scan?: bool

	// Method for selecting the host set from which to return the host with the fewest active requests.
	//
	// Defaults to ``N_CHOICES``.
	selection_method?: #LeastRequest_SelectionMethod
}

// Available methods for selecting the host set from which to return the host with the
// fewest active requests.
#LeastRequest_SelectionMethod:
	// Return host with fewest requests from a set of ``choice_count`` randomly selected hosts.
	// Best selection method for most scenarios.
	"N_CHOICES" |

	// Return host with fewest requests from all hosts.
	// Useful in some niche use cases involving low request rates and one of:
	// (example 1) low request limits on workloads, or (example 2) few hosts.
	//
	// Example 1: Consider a workload type that can only accept one connection at a time.
	// If such workloads are deployed across many hosts, only a small percentage of those
	// workloads have zero connections at any given time, and the rate of new connections is low,
	// the ``FULL_SCAN`` method is more likely to select a suitable host than ``N_CHOICES``.
	//
	// Example 2: Consider a workload type that is only deployed on 2 hosts. With default settings,
	// the ``N_CHOICES`` method will return the host with more active requests 25% of the time.
	// If the request rate is sufficiently low, the behavior of always selecting the host with least
	// requests as of the last metrics refresh may be preferable.
	"FULL_SCAN"
