// Code generated from envoy/data/dns/v2alpha/dns_table.proto. DO NOT EDIT.
package v2alpha

import (
	"list"
	"strings"
	matcher_1 "envoyproxy.io/envoy-cue/spec/type/matcher"
)

#DnsTable: {
	"@type":               "type.googleapis.com/envoy.data.dns.v2alpha.DnsTable"
	external_retry_count?: uint32
	virtual_domains!: [...#DnsTable_DnsVirtualDomain] & list.MinItems(1)
	known_suffixes?: [...matcher_1.#StringMatcher]
}

#DnsTable_AddressList: {
	"@type": "type.googleapis.com/envoy.data.dns.v2alpha.DnsTable.AddressList"
	address!: [...string] & list.MinItems(1)
}

#DnsTable_DnsEndpoint: {
	"@type":       "type.googleapis.com/envoy.data.dns.v2alpha.DnsTable.DnsEndpoint"
	address_list?: #DnsTable_AddressList
}

#DnsTable_DnsVirtualDomain: {
	"@type":     "type.googleapis.com/envoy.data.dns.v2alpha.DnsTable.DnsVirtualDomain"
	name!:       string & strings.MinRunes(2) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	endpoint?:   #DnsTable_DnsEndpoint
	answer_ttl?: string // TODO(pgv): duration bounds
}
