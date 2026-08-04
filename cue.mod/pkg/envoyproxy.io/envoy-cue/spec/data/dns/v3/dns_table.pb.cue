// Code generated from envoy/data/dns/v3/dns_table.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

// This message contains the configuration for the DNS Filter if populated
// from the control plane
#DnsTable: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable"

	// Control how many times Envoy makes an attempt to forward a query to an external DNS server
	external_retry_count?: uint32 & <=3

	// Fully qualified domain names for which Envoy will respond to DNS queries. By leaving this
	// list empty, Envoy will forward all queries to external resolvers
	virtual_domains?: [...#DnsTable_DnsVirtualDomain]

	// This field is deprecated and no longer used in Envoy. The filter's behavior has changed
	// internally to use a different data structure allowing the filter to determine whether a
	// query is for known domain without the use of this field.
	//
	// This field serves to help Envoy determine whether it can authoritatively answer a query
	// for a name matching a suffix in this list. If the query name does not match a suffix in
	// this list, Envoy will forward the query to an upstream DNS server
	known_suffixes?: [...v3_1.#StringMatcher]
}

// This message contains a list of IP addresses returned for a query for a known name
#DnsTable_AddressList: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.AddressList"

	// This field contains a well formed IP address that is returned in the answer for a
	// name query. The address field can be an IPv4 or IPv6 address. Address family
	// detection is done automatically when Envoy parses the string. Since this field is
	// repeated, Envoy will return as many entries from this list in the DNS response while
	// keeping the response under 512 bytes
	address!: [...string] & list.MinItems(1)
}

// Specify the service protocol using a numeric or string value
#DnsTable_DnsServiceProtocol: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsServiceProtocol"

	// oneof protocol_config: exactly one must be set
	// TODO(pgv): name.string well-known *validate.StringRules_WellKnownRegex
	// Specify the protocol number for the service. Envoy will try to resolve the number to
	// the protocol name. For example, 6 will resolve to "tcp". Refer to:
	// https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
	// for protocol names and numbers
	{number!: uint32 & <255} |
	{

		// Specify the protocol name for the service.
		name!: string & strings.MinRunes(1)
	}
}

// Specify the target for a given DNS service
// [#next-free-field: 6]
#DnsTable_DnsServiceTarget: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsServiceTarget"

	// The priority of the service record target
	priority?: uint32 & <65536

	// The weight of the service record target
	weight?: uint32 & <65536

	// The port to which the service is bound. This value is optional if the target is a
	// cluster. Setting port to zero in this case makes the filter use the port value
	// from the cluster host
	port?: uint32 & <65536

	// Specify the name of the endpoint for the Service. The name is a hostname or a cluster
	// oneof endpoint_type: exactly one must be set
	// TODO(pgv): host_name.string well-known *validate.StringRules_WellKnownRegex, cluster_name.string well-known *validate.StringRules_WellKnownRegex
	// Use a resolvable hostname as the endpoint for a service.
	{host_name!: string & strings.MinRunes(1)} |
	{

		// Use a cluster name as the endpoint for a service.
		cluster_name!: string & strings.MinRunes(1)
	}
}

// This message defines a service selection record returned for a service query in a domain
#DnsTable_DnsService: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsService"

	// The name of the service without the protocol or domain name
	service_name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// The service protocol. This can be specified as a string or the numeric value of the protocol
	protocol?: #DnsTable_DnsServiceProtocol

	// The service entry time to live. This is independent from the DNS Answer record TTL
	ttl?: string // TODO(pgv): duration bounds

	// The list of targets hosting the service
	targets!: [...#DnsTable_DnsServiceTarget] & list.MinItems(1)
}

// Define a list of service records for a given service
#DnsTable_DnsServiceList: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsServiceList"
	services!: [...#DnsTable_DnsService] & list.MinItems(1)
}

#DnsTable_DnsEndpoint: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsEndpoint"

	// oneof endpoint_config: exactly one must be set
	// Define a list of addresses to return for the specified endpoint
	{address_list!: #DnsTable_AddressList} |
	{

		// Define a cluster whose addresses are returned for the specified endpoint
		cluster_name!: string
	} |
	{

		// Define a DNS Service List for the specified endpoint
		service_list!: #DnsTable_DnsServiceList
	}
}

#DnsTable_DnsVirtualDomain: {
	"@type": "type.googleapis.com/envoy.data.dns.v3.DnsTable.DnsVirtualDomain"

	// A domain name for which Envoy will respond to query requests.
	// Wildcard records are supported on the first label only, e.g. ``*.example.com`` or ``*.subdomain.example.com``.
	// Names such as ``*example.com``, ``subdomain.*.example.com``, ``*subdomain.example.com``, etc
	// are not valid wildcard names and asterisk will be interpreted as a literal ``*`` character.
	// Wildcard records match subdomains on any levels, e.g. ``*.example.com`` will match
	// ``foo.example.com``, ``bar.foo.example.com``, ``baz.bar.foo.example.com``, etc. In case there are multiple
	// wildcard records, the longest wildcard match will be used, e.g. if there are wildcard records for
	// ``*.example.com`` and ``*.foo.example.com`` and the query is for ``bar.foo.example.com``, the latter will be used.
	// Specific records will always take precedence over wildcard records.
	name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// The configuration containing the method to determine the address of this endpoint
	endpoint?: #DnsTable_DnsEndpoint

	// Sets the TTL in DNS answers from Envoy returned to the client. The default TTL is 300s
	answer_ttl?: string // TODO(pgv): duration bounds
}
