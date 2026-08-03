// Code generated from envoy/config/common/dynamic_forward_proxy/v2alpha/dns_cache.proto. DO NOT EDIT.
package v2alpha

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/api/v2"
)

#DnsCacheConfig: {
	"@type":                   "type.googleapis.com/envoy.config.common.dynamic_forward_proxy.v2alpha.DnsCacheConfig"
	name!:                     string & !=""
	dns_lookup_family?:        v2_1.#Cluster_DnsLookupFamily
	dns_refresh_rate?:         string // TODO(pgv): duration bounds
	host_ttl?:                 string // TODO(pgv): duration bounds
	max_hosts?:                uint32 & >0
	dns_failure_refresh_rate?: v2_1.#Cluster_RefreshRate
}
