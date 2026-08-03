// Code generated from envoy/extensions/load_balancing_policies/override_host/v3/override_host.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

#OverrideHost: {
	"@type": "type.googleapis.com/envoy.extensions.load_balancing_policies.override_host.v3.OverrideHost"
	override_host_sources!: [...#OverrideHost_OverrideHostSource] & list.MinItems(1)
	fallback_policy!: v3_1.#LoadBalancingPolicy
}

#OverrideHost_OverrideHostSource: {
	"@type":   "type.googleapis.com/envoy.extensions.load_balancing_policies.override_host.v3.OverrideHost.OverrideHostSource"
	header?:   string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	metadata?: v3_2.#MetadataKey
}
