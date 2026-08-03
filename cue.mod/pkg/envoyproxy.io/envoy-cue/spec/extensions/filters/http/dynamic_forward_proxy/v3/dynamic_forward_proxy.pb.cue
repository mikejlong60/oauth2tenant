// Code generated from envoy/extensions/filters/http/dynamic_forward_proxy/v3/dynamic_forward_proxy.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/dynamic_forward_proxy/v3"
)

#FilterConfig: {
	"@type":                               "type.googleapis.com/envoy.extensions.filters.http.dynamic_forward_proxy.v3.FilterConfig"
	dns_cache_config?:                     v3_1.#DnsCacheConfig
	sub_cluster_config?:                   #SubClusterConfig
	save_upstream_address?:                bool
	allow_dynamic_host_from_filter_state?: bool
}

#PerRouteConfig: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.dynamic_forward_proxy.v3.PerRouteConfig"
	host_rewrite_literal?: string
	host_rewrite_header?:  string
}

#SubClusterConfig: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.dynamic_forward_proxy.v3.SubClusterConfig"
	cluster_init_timeout?: string // TODO(pgv): duration bounds
}
