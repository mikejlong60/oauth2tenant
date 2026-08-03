// Code generated from envoy/extensions/filters/http/header_mutation/v3/header_mutation.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/common/mutation_rules/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Mutations: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.header_mutation.v3.Mutations"
	request_mutations?: [...v3_1.#HeaderMutation]
	query_parameter_mutations?: [...v3_2.#KeyValueMutation]
	response_mutations?: [...v3_1.#HeaderMutation]
	response_trailers_mutations?: [...v3_1.#HeaderMutation]
	request_trailers_mutations?: [...v3_1.#HeaderMutation]
}

#HeaderMutationPerRoute: {
	"@type":    "type.googleapis.com/envoy.extensions.filters.http.header_mutation.v3.HeaderMutationPerRoute"
	mutations?: #Mutations
}

#HeaderMutation: {
	"@type":                              "type.googleapis.com/envoy.extensions.filters.http.header_mutation.v3.HeaderMutation"
	mutations?:                           #Mutations
	most_specific_header_mutations_wins?: bool
}
