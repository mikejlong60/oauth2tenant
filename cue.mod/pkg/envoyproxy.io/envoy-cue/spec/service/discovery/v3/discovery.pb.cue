// Code generated from envoy/service/discovery/v3/discovery.proto. DO NOT EDIT.
package v3

import (
	status_1 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ResourceLocator: {
	"@type": "type.googleapis.com/envoy.service.discovery.v3.ResourceLocator"
	name?:   string
	dynamic_parameters?: {[string]: string}
}

#ResourceName: {
	"@type":                        "type.googleapis.com/envoy.service.discovery.v3.ResourceName"
	name?:                          string
	dynamic_parameter_constraints?: #DynamicParameterConstraints
}

#ResourceError: {
	"@type":        "type.googleapis.com/envoy.service.discovery.v3.ResourceError"
	resource_name?: #ResourceName
	error_detail?:  status_1.#Status
}

#DiscoveryRequest: {
	"@type":       "type.googleapis.com/envoy.service.discovery.v3.DiscoveryRequest"
	version_info?: string
	node?:         v3_2.#Node
	resource_names?: [...string]
	resource_locators?: [...#ResourceLocator]
	type_url?:       string
	response_nonce?: string
	error_detail?:   status_1.#Status
}

#DiscoveryResponse: {
	"@type":       "type.googleapis.com/envoy.service.discovery.v3.DiscoveryResponse"
	version_info?: string
	resources?: [...{...}]
	canary?:        bool
	type_url?:      string
	nonce?:         string
	control_plane?: v3_2.#ControlPlane
	resource_errors?: [...#ResourceError]
}

#DeltaDiscoveryRequest: {
	"@type":   "type.googleapis.com/envoy.service.discovery.v3.DeltaDiscoveryRequest"
	node?:     v3_2.#Node
	type_url?: string
	resource_names_subscribe?: [...string]
	resource_names_unsubscribe?: [...string]
	resource_locators_subscribe?: [...#ResourceLocator]
	resource_locators_unsubscribe?: [...#ResourceLocator]
	initial_resource_versions?: {[string]: string}
	response_nonce?: string
	error_detail?:   status_1.#Status
}

#DeltaDiscoveryResponse: {
	"@type":              "type.googleapis.com/envoy.service.discovery.v3.DeltaDiscoveryResponse"
	system_version_info?: string
	resources?: [...#Resource]
	type_url?: string
	removed_resources?: [...string]
	removed_resource_names?: [...#ResourceName]
	nonce?:         string
	control_plane?: v3_2.#ControlPlane
	resource_errors?: [...#ResourceError]
}

#DynamicParameterConstraints: {
	"@type": "type.googleapis.com/envoy.service.discovery.v3.DynamicParameterConstraints"

	// oneof type: at most one may be set
	*{} |
	{constraint!: #DynamicParameterConstraints_SingleConstraint} |
	{or_constraints!: #DynamicParameterConstraints_ConstraintList} |
	{and_constraints!: #DynamicParameterConstraints_ConstraintList} |
	{not_constraints!: #DynamicParameterConstraints}
}

#DynamicParameterConstraints_SingleConstraint: {
	"@type": "type.googleapis.com/envoy.service.discovery.v3.DynamicParameterConstraints.SingleConstraint"
	key?:    string

	// oneof constraint_type: exactly one must be set
	{value!: string} |
	{exists!: #DynamicParameterConstraints_SingleConstraint_Exists}
}

#DynamicParameterConstraints_SingleConstraint_Exists: {
	"@type": "type.googleapis.com/envoy.service.discovery.v3.DynamicParameterConstraints.SingleConstraint.Exists"
}

#DynamicParameterConstraints_ConstraintList: {
	"@type": "type.googleapis.com/envoy.service.discovery.v3.DynamicParameterConstraints.ConstraintList"
	constraints?: [...#DynamicParameterConstraints]
}

#Resource: {
	"@type":        "type.googleapis.com/envoy.service.discovery.v3.Resource"
	name?:          string
	resource_name?: #ResourceName
	aliases?: [...string]
	version?: string
	resource?: {...}
	ttl?:           string
	cache_control?: #Resource_CacheControl
	metadata?:      v3_2.#Metadata
}

#Resource_CacheControl: {
	"@type":       "type.googleapis.com/envoy.service.discovery.v3.Resource.CacheControl"
	do_not_cache?: bool
}
