// Code generated from envoy/api/v2/route.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	route_1 "envoyproxy.io/envoy-cue/spec/api/v2/route"
)

#RouteConfiguration: {
	"@type": "type.googleapis.com/envoy.api.v2.RouteConfiguration"
	name?:   string
	virtual_hosts?: [...route_1.#VirtualHost]
	vhds?: #Vhds
	internal_only_headers?: [...string]
	response_headers_to_add?: [...core_2.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	request_headers_to_add?: [...core_2.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	most_specific_header_mutations_wins?: bool
	validate_clusters?:                   bool
}

#Vhds: {
	"@type":        "type.googleapis.com/envoy.api.v2.Vhds"
	config_source!: core_2.#ConfigSource
}
