// Code generated from envoy/extensions/common/dynamic_forward_proxy/v3/dns_cache.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/cluster/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/common/key_value/v3"
)

#DnsCacheCircuitBreakers: {
	"@type":               "type.googleapis.com/envoy.extensions.common.dynamic_forward_proxy.v3.DnsCacheCircuitBreakers"
	max_pending_requests?: uint32
}

#DnsCacheConfig: {
	"@type":                         "type.googleapis.com/envoy.extensions.common.dynamic_forward_proxy.v3.DnsCacheConfig"
	name!:                           string & strings.MinRunes(1)
	dns_lookup_family?:              v3_1.#Cluster_DnsLookupFamily
	dns_refresh_rate?:               string // TODO(pgv): duration bounds
	dns_min_refresh_rate?:           string // TODO(pgv): duration bounds
	host_ttl?:                       string // TODO(pgv): duration bounds
	max_hosts?:                      uint32 & >0
	disable_dns_refresh_on_failure?: bool
	dns_failure_refresh_rate?:       v3_1.#Cluster_RefreshRate
	dns_cache_circuit_breaker?:      #DnsCacheCircuitBreakers
	use_tcp_for_dns_lookups?:        bool
	dns_resolution_config?:          v3_2.#DnsResolutionConfig
	typed_dns_resolver_config?:      v3_2.#TypedExtensionConfig
	preresolve_hostnames?: [...v3_2.#SocketAddress]
	dns_query_timeout?: string // TODO(pgv): duration bounds
	key_value_config?:  v3_3.#KeyValueStoreConfig
}
