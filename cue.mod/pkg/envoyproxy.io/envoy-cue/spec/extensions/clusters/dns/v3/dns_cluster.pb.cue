// Code generated from envoy/extensions/clusters/dns/v3/dns_cluster.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/clusters/common/dns/v3"
)

#DnsCluster: {
	"@type":                           "type.googleapis.com/envoy.extensions.clusters.dns.v3.DnsCluster"
	dns_refresh_rate?:                 string // TODO(pgv): duration bounds
	dns_failure_refresh_rate?:         #DnsCluster_RefreshRate
	respect_dns_ttl?:                  bool
	dns_jitter?:                       string // TODO(pgv): duration bounds
	typed_dns_resolver_config?:        v3_1.#TypedExtensionConfig
	dns_lookup_family?:                v3_2.#DnsLookupFamily
	all_addresses_in_single_endpoint?: bool
}

#DnsCluster_RefreshRate: {
	"@type":        "type.googleapis.com/envoy.extensions.clusters.dns.v3.DnsCluster.RefreshRate"
	base_interval!: string // TODO(pgv): duration bounds
	max_interval?:  string // TODO(pgv): duration bounds
}
