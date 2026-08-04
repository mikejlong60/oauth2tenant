// Code generated from envoy/config/listener/v3/listener_components.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#Filter: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.Filter"
	name!:   string & strings.MinRunes(1)

	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}} |
	{config_discovery!: v3_1.#ExtensionConfigSource}
}

#FilterChainMatch: {
	"@type":           "type.googleapis.com/envoy.config.listener.v3.FilterChainMatch"
	destination_port?: uint32 & >=1 & <=65535
	prefix_ranges?: [...v3_1.#CidrRange]
	address_suffix?: string
	suffix_len?:     uint32
	direct_source_prefix_ranges?: [...v3_1.#CidrRange]
	source_type?: #FilterChainMatch_ConnectionSourceType
	source_prefix_ranges?: [...v3_1.#CidrRange]
	source_ports?: [...uint32]
	server_names?: [...string]
	transport_protocol?: string
	application_protocols?: [...string]
}

#FilterChainMatch_ConnectionSourceType: "ANY" | "SAME_IP_OR_LOOPBACK" | "EXTERNAL"

#FilterChain: {
	"@type":             "type.googleapis.com/envoy.config.listener.v3.FilterChain"
	filter_chain_match?: #FilterChainMatch
	filters?: [...#Filter]
	use_proxy_proto?:                  bool
	metadata?:                         v3_1.#Metadata
	transport_socket?:                 v3_1.#TransportSocket
	transport_socket_connect_timeout?: string
	name?:                             string
}

#ListenerFilterChainMatchPredicate: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.ListenerFilterChainMatchPredicate"

	// oneof rule: exactly one must be set
	{or_match!: #ListenerFilterChainMatchPredicate_MatchSet} |
	{and_match!: #ListenerFilterChainMatchPredicate_MatchSet} |
	{not_match!: #ListenerFilterChainMatchPredicate} |
	{any_match!: bool & true} |
	{destination_port_range!: v3_2.#Int32Range}
}

#ListenerFilterChainMatchPredicate_MatchSet: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.ListenerFilterChainMatchPredicate.MatchSet"
	rules!: [...#ListenerFilterChainMatchPredicate] & list.MinItems(2)
}

#ListenerFilter: {
	"@type":          "type.googleapis.com/envoy.config.listener.v3.ListenerFilter"
	name!:            string & strings.MinRunes(1)
	filter_disabled?: #ListenerFilterChainMatchPredicate

	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}} |
	{config_discovery!: v3_1.#ExtensionConfigSource}
}
