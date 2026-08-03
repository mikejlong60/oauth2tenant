// Code generated from envoy/config/route/v3/route.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#RouteConfiguration: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteConfiguration"
	name?:   string
	virtual_hosts?: [...#VirtualHost]
	vhds?: #Vhds
	internal_only_headers?: [...string]
	response_headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	request_headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	most_specific_header_mutations_wins?: bool
	validate_clusters?:                   bool
	max_direct_response_body_size_bytes?: uint32
	cluster_specifier_plugins?: [...#ClusterSpecifierPlugin]
	request_mirror_policies?: [...#RouteAction_RequestMirrorPolicy]
	ignore_port_in_host_matching?:            bool
	vhost_header?:                            string
	ignore_path_parameters_in_path_matching?: bool
	typed_per_filter_config?: {[string]: {...}}
	metadata?: v3_1.#Metadata
}

#Vhds: {
	"@type":        "type.googleapis.com/envoy.config.route.v3.Vhds"
	config_source!: v3_1.#ConfigSource
}
