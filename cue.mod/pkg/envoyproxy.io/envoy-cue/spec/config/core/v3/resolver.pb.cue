// Code generated from envoy/config/core/v3/resolver.proto. DO NOT EDIT.
package v3

import (
	"list"
)

#DnsResolverOptions: {
	"@type":                   "type.googleapis.com/envoy.config.core.v3.DnsResolverOptions"
	use_tcp_for_dns_lookups?:  bool
	no_default_search_domain?: bool
}

#DnsResolutionConfig: {
	"@type": "type.googleapis.com/envoy.config.core.v3.DnsResolutionConfig"
	resolvers!: [...#Address] & list.MinItems(1)
	dns_resolver_options?: #DnsResolverOptions
}
