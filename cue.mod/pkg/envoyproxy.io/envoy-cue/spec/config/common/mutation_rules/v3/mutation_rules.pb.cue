// Code generated from envoy/config/common/mutation_rules/v3/mutation_rules.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#HeaderMutationRules: {
	"@type":              "type.googleapis.com/envoy.config.common.mutation_rules.v3.HeaderMutationRules"
	allow_all_routing?:   bool
	allow_envoy?:         bool
	disallow_system?:     bool
	disallow_all?:        bool
	allow_expression?:    v3_1.#RegexMatcher
	disallow_expression?: v3_1.#RegexMatcher
	disallow_is_error?:   bool
}

#HeaderMutation: {
	"@type": "type.googleapis.com/envoy.config.common.mutation_rules.v3.HeaderMutation"

	// oneof action: exactly one must be set
	// TODO(pgv): remove.string well-known *validate.StringRules_WellKnownRegex
	{remove!: string} |
	{append!: v3_2.#HeaderValueOption} |
	{remove_on_match!: #HeaderMutation_RemoveOnMatch}
}

#HeaderMutation_RemoveOnMatch: {
	"@type":      "type.googleapis.com/envoy.config.common.mutation_rules.v3.HeaderMutation.RemoveOnMatch"
	key_matcher!: v3_1.#StringMatcher
}
