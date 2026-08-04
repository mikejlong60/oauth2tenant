// Code generated from envoy/extensions/filters/udp/dns_filter/v3/dns_filter.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/data/dns/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#DnsFilterConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.udp.dns_filter.v3.DnsFilterConfig"
	stat_prefix!:   string & strings.MinRunes(1)
	server_config?: #DnsFilterConfig_ServerContextConfig
	client_config?: #DnsFilterConfig_ClientContextConfig
	access_log?: [...v3_1.#AccessLog]
}

#DnsFilterConfig_ServerContextConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.udp.dns_filter.v3.DnsFilterConfig.ServerContextConfig"

	// oneof config_source: exactly one must be set
	{inline_dns_table!: v3_2.#DnsTable} |
	{external_dns_table!: v3_3.#DataSource}
}

#DnsFilterConfig_ClientContextConfig: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.udp.dns_filter.v3.DnsFilterConfig.ClientContextConfig"
	resolver_timeout?: string // TODO(pgv): duration bounds
	upstream_resolvers?: [...v3_3.#Address]
	dns_resolution_config?:     v3_3.#DnsResolutionConfig
	typed_dns_resolver_config?: v3_3.#TypedExtensionConfig
	max_pending_lookups?:       uint64 & >=1
}
