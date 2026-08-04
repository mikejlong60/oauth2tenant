// Code generated from envoy/data/dns/v3/dns_table.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#DnsTable: {
	"@type":               "type.googleapis.com/envoy.data.dns.v3.DnsTable"
	external_retry_count?: uint32 & <=3
	virtual_domains?: [...#DnsTable_DnsVirtualDomain]
	known_suffixes?: [...v3_1.#StringMatcher]
}

#DnsTable_AddressList: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.AddressList"
	address!: [...string] & list.MinItems(1)
}

#DnsTable_DnsServiceProtocol: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsServiceProtocol"

	// oneof protocol_config: exactly one must be set
	// TODO(pgv): name.string well-known *validate.StringRules_WellKnownRegex
	{number!: uint32 & <255} |
	{name!: string & strings.MinRunes(1)}
}

#DnsTable_DnsServiceTarget: {
	"@type":   "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsServiceTarget"
	priority?: uint32 & <65536
	weight?:   uint32 & <65536
	port?:     uint32 & <65536

	// oneof endpoint_type: exactly one must be set
	// TODO(pgv): host_name.string well-known *validate.StringRules_WellKnownRegex, cluster_name.string well-known *validate.StringRules_WellKnownRegex
	{host_name!: string & strings.MinRunes(1)} |
	{cluster_name!: string & strings.MinRunes(1)}
}

#DnsTable_DnsService: {
	"@type":       "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsService"
	service_name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	protocol?:     #DnsTable_DnsServiceProtocol
	ttl?:          string // TODO(pgv): duration bounds
	targets!: [...#DnsTable_DnsServiceTarget] & list.MinItems(1)
}

#DnsTable_DnsServiceList: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsServiceList"
	services!: [...#DnsTable_DnsService] & list.MinItems(1)
}

#DnsTable_DnsEndpoint: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsEndpoint"

	// oneof endpoint_config: exactly one must be set
	{address_list!: #DnsTable_AddressList} |
	{cluster_name!: string} |
	{service_list!: #DnsTable_DnsServiceList}
}

#DnsTable_DnsVirtualDomain: {
	"@type":     "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsVirtualDomain"
	name!:       string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	endpoint?:   #DnsTable_DnsEndpoint
	answer_ttl?: string // TODO(pgv): duration bounds
}
