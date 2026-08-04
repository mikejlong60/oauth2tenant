// Code generated from envoy/extensions/filters/network/rbac/v3/rbac.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/rbac/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

// RBAC network filter config.
//
// Header should not be used in rules/shadow_rules in RBAC network filter as
// this information is only available in :ref:`RBAC http filter <config_http_filters_rbac>`.
// [#next-free-field: 9]
#RBAC: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.rbac.v3.RBAC"

	// Specify the RBAC rules to be applied globally.
	// If absent, no enforcing RBAC policy will be applied.
	// If present and empty, DENY.
	// If both rules and matcher are configured, rules will be ignored.
	rules?: v3_1.#RBAC

	// The match tree to use when resolving RBAC action for incoming connections. Connections do
	// not match any matcher will be denied.
	// If absent, no enforcing RBAC matcher will be applied.
	// If present and empty, deny all connections.
	matcher?: v3_2.#Matcher

	// Shadow rules are not enforced by the filter but will emit stats and logs
	// and can be used for rule testing.
	// If absent, no shadow RBAC policy will be applied.
	// If both shadow rules and shadow matcher are configured, shadow rules will be ignored.
	shadow_rules?: v3_1.#RBAC

	// The match tree to use for emitting stats and logs which can be used for rule testing for
	// incoming connections.
	// If absent, no shadow matcher will be applied.
	shadow_matcher?: v3_2.#Matcher

	// If specified, shadow rules will emit stats with the given prefix.
	// This is useful to distinguish the stat when there are more than 1 RBAC filter configured with
	// shadow rules.
	shadow_rules_stat_prefix?: string

	// The prefix to use when emitting statistics.
	stat_prefix!: string & strings.MinRunes(1)

	// RBAC enforcement strategy. By default RBAC will be enforced only once
	// when the first byte of data arrives from the downstream. When used in
	// conjunction with filters that emit dynamic metadata after decoding
	// every payload (e.g., Mongo, MySQL, Kafka) set the enforcement type to
	// CONTINUOUS to enforce RBAC policies on every message boundary.
	enforcement_type?: #RBAC_EnforcementType

	// Delay the specified duration before closing the connection when the policy evaluation
	// result is ``DENY``. If this is not present, the connection will be closed immediately.
	// This is useful to provide a better protection for Envoy against clients that retries
	// aggressively when the connection is rejected by the RBAC filter.
	delay_deny?: string
}

#RBAC_EnforcementType:
	// Apply RBAC policies when the first byte of data arrives on the connection.
	"ONE_TIME_ON_FIRST_BYTE" |

	// Continuously apply RBAC policies as data arrives. Use this mode when
	// using RBAC with message oriented protocols such as Mongo, MySQL, Kafka,
	// etc. when the protocol decoders emit dynamic metadata such as the
	// resources being accessed and the operations on the resources.
	"CONTINUOUS"
