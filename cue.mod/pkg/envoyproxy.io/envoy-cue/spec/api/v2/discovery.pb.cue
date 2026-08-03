// Code generated from envoy/api/v2/discovery.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	status_2 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
)

#DiscoveryRequest: {
	"@type":       "type.googleapis.com/envoy.api.v2.DiscoveryRequest"
	version_info?: string
	node?:         core_1.#Node
	resource_names?: [...string]
	type_url?:       string
	response_nonce?: string
	error_detail?:   status_2.#Status
}

#DiscoveryResponse: {
	"@type":       "type.googleapis.com/envoy.api.v2.DiscoveryResponse"
	version_info?: string
	resources?: [...{...}]
	canary?:        bool
	type_url?:      string
	nonce?:         string
	control_plane?: core_1.#ControlPlane
}

#DeltaDiscoveryRequest: {
	"@type":   "type.googleapis.com/envoy.api.v2.DeltaDiscoveryRequest"
	node?:     core_1.#Node
	type_url?: string
	resource_names_subscribe?: [...string]
	resource_names_unsubscribe?: [...string]
	initial_resource_versions?: {[string]: string}
	response_nonce?: string
	error_detail?:   status_2.#Status
}

#DeltaDiscoveryResponse: {
	"@type":              "type.googleapis.com/envoy.api.v2.DeltaDiscoveryResponse"
	system_version_info?: string
	resources?: [...#Resource]
	type_url?: string
	removed_resources?: [...string]
	nonce?: string
}

#Resource: {
	"@type": "type.googleapis.com/envoy.api.v2.Resource"
	name?:   string
	aliases?: [...string]
	version?: string
	resource?: {...}
}
