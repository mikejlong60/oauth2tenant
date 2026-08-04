// Code generated from envoy/config/filter/http/dynamic_forward_proxy/v2alpha/dynamic_forward_proxy.proto. DO NOT EDIT.
package v2alpha

import (
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/config/common/dynamic_forward_proxy/v2alpha"
)

#FilterConfig: {
	"@type":           "type.googleapis.com/envoy.config.filter.http.dynamic_forward_proxy.v2alpha.FilterConfig"
	dns_cache_config!: v2alpha_1.#DnsCacheConfig
}

#PerRouteConfig: {
	"@type": "type.googleapis.com/envoy.config.filter.http.dynamic_forward_proxy.v2alpha.PerRouteConfig"

	// oneof host_rewrite_specifier: at most one may be set
	*{} |
	{host_rewrite!: string} |
	{auto_host_rewrite_header!: string}
}
