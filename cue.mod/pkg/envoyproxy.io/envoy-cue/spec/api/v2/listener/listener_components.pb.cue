// Code generated from envoy/api/v2/listener/listener_components.proto. DO NOT EDIT.
package listener

import (
	"list"
	auth_2 "envoyproxy.io/envoy-cue/spec/api/v2/auth"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_3 "envoyproxy.io/envoy-cue/spec/type"
)

#Filter: {
	"@type": "type.googleapis.com/envoy.api.v2.listener.Filter"
	name!:   string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#FilterChainMatch: {
	"@type":           "type.googleapis.com/envoy.api.v2.listener.FilterChainMatch"
	destination_port?: uint32 & >=1 & <=65535
	prefix_ranges?: [...core_1.#CidrRange]
	address_suffix?: string
	suffix_len?:     uint32
	source_type?:    #FilterChainMatch_ConnectionSourceType
	source_prefix_ranges?: [...core_1.#CidrRange]
	source_ports?: [...uint32]
	server_names?: [...string]
	transport_protocol?: string
	application_protocols?: [...string]
}

#FilterChainMatch_ConnectionSourceType: "ANY" | "LOCAL" | "EXTERNAL"

#FilterChain: {
	"@type":             "type.googleapis.com/envoy.api.v2.listener.FilterChain"
	filter_chain_match?: #FilterChainMatch
	tls_context?:        auth_2.#DownstreamTlsContext
	filters?: [...#Filter]
	use_proxy_proto?:  bool
	metadata?:         core_1.#Metadata
	transport_socket?: core_1.#TransportSocket
	name?:             string
}

#ListenerFilterChainMatchPredicate: {
	"@type": "type.googleapis.com/envoy.api.v2.listener.ListenerFilterChainMatchPredicate"

	// oneof rule: exactly one must be set
	{or_match!: #ListenerFilterChainMatchPredicate_MatchSet} |
	{and_match!: #ListenerFilterChainMatchPredicate_MatchSet} |
	{not_match!: #ListenerFilterChainMatchPredicate} |
	{any_match!: bool & true} |
	{destination_port_range!: type_3.#Int32Range}
}

#ListenerFilterChainMatchPredicate_MatchSet: {
	"@type": "type.googleapis.com/envoy.api.v2.listener.ListenerFilterChainMatchPredicate.MatchSet"
	rules!: [...#ListenerFilterChainMatchPredicate] & list.MinItems(2)
}

#ListenerFilter: {
	"@type":          "type.googleapis.com/envoy.api.v2.listener.ListenerFilter"
	name!:            string & !=""
	filter_disabled?: #ListenerFilterChainMatchPredicate

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}
