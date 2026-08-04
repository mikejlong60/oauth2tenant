// Code generated from envoy/extensions/http/early_header_mutation/header_mutation/v3/header_mutation.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/common/mutation_rules/v3"
)

// This extension allows for early header mutation by the substitution formatter.
#HeaderMutation: {
	"@type": "type.googleapis.com/envoy.extensions.http.early_header_mutation.header_mutation.v3.HeaderMutation"
	mutations!: [...v3_1.#HeaderMutation] & list.MinItems(1)
}
