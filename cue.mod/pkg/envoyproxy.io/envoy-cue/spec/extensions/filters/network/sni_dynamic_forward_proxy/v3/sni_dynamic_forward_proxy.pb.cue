// Code generated from envoy/extensions/filters/network/sni_dynamic_forward_proxy/v3/sni_dynamic_forward_proxy.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/dynamic_forward_proxy/v3"
)

#FilterConfig: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.network.sni_dynamic_forward_proxy.v3.FilterConfig"
	dns_cache_config!:      v3_1.#DnsCacheConfig
	save_upstream_address?: bool

	// oneof port_specifier: at most one may be set
	*{} |
	{port_value!: uint32 & >0 & <=65535}
}
