// Code generated from envoy/extensions/network/dns_resolver/cares/v3/cares_dns_resolver.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#CaresDnsResolverConfig: {
	"@type": "type.googleapis.com/envoy.extensions.network.dns_resolver.cares.v3.CaresDnsResolverConfig"
	resolvers?: [...v3_1.#Address]
	use_resolvers_as_fallback?:  bool
	filter_unroutable_families?: bool
	dns_resolver_options?:       v3_1.#DnsResolverOptions
	udp_max_queries?:            uint32
	query_timeout_seconds?:      uint64 & >=1
	query_tries?:                uint32 & >=1
	rotate_nameservers?:         bool
	edns0_max_payload_size?:     uint32 & >=512 & <=4096
	max_udp_channel_duration?:   string // TODO(pgv): duration bounds
	reinit_channel_on_timeout?:  bool
}
