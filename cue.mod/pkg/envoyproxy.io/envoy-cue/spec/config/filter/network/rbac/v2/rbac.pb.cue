// Code generated from envoy/config/filter/network/rbac/v2/rbac.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/rbac/v2"
)

// RBAC network filter config.
//
// Header should not be used in rules/shadow_rules in RBAC network filter as
// this information is only available in :ref:`RBAC http filter <config_http_filters_rbac>`.
#RBAC: {
	"@type": "type.googleapis.com/envoy.config.filter.network.rbac.v2.RBAC"

	// Specify the RBAC rules to be applied globally.
	// If absent, no enforcing RBAC policy will be applied.
	rules?: v2_1.#RBAC

	// Shadow rules are not enforced by the filter but will emit stats and logs
	// and can be used for rule testing.
	// If absent, no shadow RBAC policy will be applied.
	shadow_rules?: v2_1.#RBAC

	// The prefix to use when emitting statistics.
	stat_prefix!: string & !=""

	// RBAC enforcement strategy. By default RBAC will be enforced only once
	// when the first byte of data arrives from the downstream. When used in
	// conjunction with filters that emit dynamic metadata after decoding
	// every payload (e.g., Mongo, MySQL, Kafka) set the enforcement type to
	// CONTINUOUS to enforce RBAC policies on every message boundary.
	enforcement_type?: #RBAC_EnforcementType
}

#RBAC_EnforcementType:
	// Apply RBAC policies when the first byte of data arrives on the connection.
	"ONE_TIME_ON_FIRST_BYTE" |

	// Continuously apply RBAC policies as data arrives. Use this mode when
	// using RBAC with message oriented protocols such as Mongo, MySQL, Kafka,
	// etc. when the protocol decoders emit dynamic metadata such as the
	// resources being accessed and the operations on the resources.
	"CONTINUOUS"
