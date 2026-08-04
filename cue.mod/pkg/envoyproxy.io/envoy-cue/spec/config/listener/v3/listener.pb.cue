// Code generated from envoy/config/listener/v3/listener.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
)

#AdditionalAddress: {
	"@type":         "type.googleapis.com/envoy.config.listener.v3.AdditionalAddress"
	address?:        v3_1.#Address
	socket_options?: v3_1.#SocketOptionsOverride
	tcp_keepalive?:  v3_1.#TcpKeepalive
}

#ListenerCollection: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.ListenerCollection"
	entries?: [...v3_2.#CollectionEntry]
}

#Listener: {
	"@type":  "type.googleapis.com/envoy.config.listener.v3.Listener"
	name?:    string
	address?: v3_1.#Address
	additional_addresses?: [...#AdditionalAddress]
	stat_prefix?: string
	filter_chains?: [...#FilterChain]
	fcds_config?:                       #Listener_FcdsConfig
	filter_chain_matcher?:              v3_3.#Matcher
	use_original_dst?:                  bool
	default_filter_chain?:              #FilterChain
	per_connection_buffer_limit_bytes?: uint32
	metadata?:                          v3_1.#Metadata
	deprecated_v1?:                     #Listener_DeprecatedV1
	drain_type?:                        #Listener_DrainType
	listener_filters?: [...#ListenerFilter]
	listener_filters_timeout?:             string
	continue_on_listener_filters_timeout?: bool
	transparent?:                          bool
	freebind?:                             bool
	socket_options?: [...v3_1.#SocketOption]
	tcp_fast_open_queue_length?: uint32
	traffic_direction?:          v3_1.#TrafficDirection
	udp_listener_config?:        #UdpListenerConfig
	api_listener?:               #ApiListener
	connection_balance_config?:  #Listener_ConnectionBalanceConfig
	reuse_port?:                 bool
	enable_reuse_port?:          bool
	access_log?: [...v3_4.#AccessLog]
	tcp_backlog_size?:                           uint32
	max_connections_to_accept_per_socket_event?: uint32 & >0
	bind_to_port?:                               bool
	enable_mptcp?:                               bool
	ignore_global_conn_limit?:                   bool
	bypass_overload_manager?:                    bool
	tcp_keepalive?:                              v3_1.#TcpKeepalive

	// oneof listener_specifier: at most one may be set
	*{} |
	{internal_listener!: #Listener_InternalListenerConfig}
}

#Listener_DeprecatedV1: {
	"@type":       "type.googleapis.com/envoy.config.listener.v3.Listener.DeprecatedV1"
	bind_to_port?: bool
}

#Listener_ConnectionBalanceConfig: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.Listener.ConnectionBalanceConfig"

	// oneof balance_type: exactly one must be set
	{exact_balance!: #Listener_ConnectionBalanceConfig_ExactBalance} |
	{extend_balance!: v3_1.#TypedExtensionConfig}
}

#Listener_ConnectionBalanceConfig_ExactBalance: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.Listener.ConnectionBalanceConfig.ExactBalance"
}

#Listener_InternalListenerConfig: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.Listener.InternalListenerConfig"
}

#Listener_FcdsConfig: {
	"@type":        "type.googleapis.com/envoy.config.listener.v3.Listener.FcdsConfig"
	name?:          string
	config_source?: v3_1.#ConfigSource
}

#Listener_DrainType: "DEFAULT" | "MODIFY_ONLY"

#ListenerManager: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.ListenerManager"
}

#ValidationListenerManager: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.ValidationListenerManager"
}

#ApiListenerManager: {
	"@type": "type.googleapis.com/envoy.config.listener.v3.ApiListenerManager"
}
