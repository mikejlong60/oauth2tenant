// Code generated from envoy/api/v2/listener.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	listener_2 "envoyproxy.io/envoy-cue/spec/api/v2/listener"
	v2_3 "envoyproxy.io/envoy-cue/spec/config/listener/v2"
	v2_4 "envoyproxy.io/envoy-cue/spec/config/filter/accesslog/v2"
)

#Listener: {
	"@type":  "type.googleapis.com/envoy.api.v2.Listener"
	name?:    string
	address!: core_1.#Address
	filter_chains?: [...listener_2.#FilterChain]
	use_original_dst?:                  bool
	per_connection_buffer_limit_bytes?: uint32
	metadata?:                          core_1.#Metadata
	deprecated_v1?:                     #Listener_DeprecatedV1
	drain_type?:                        #Listener_DrainType
	listener_filters?: [...listener_2.#ListenerFilter]
	listener_filters_timeout?:             string
	continue_on_listener_filters_timeout?: bool
	transparent?:                          bool
	freebind?:                             bool
	socket_options?: [...core_1.#SocketOption]
	tcp_fast_open_queue_length?: uint32
	traffic_direction?:          core_1.#TrafficDirection
	udp_listener_config?:        listener_2.#UdpListenerConfig
	api_listener?:               v2_3.#ApiListener
	connection_balance_config?:  #Listener_ConnectionBalanceConfig
	reuse_port?:                 bool
	access_log?: [...v2_4.#AccessLog]
}

#Listener_DeprecatedV1: {
	"@type":       "type.googleapis.com/envoy.api.v2.Listener.DeprecatedV1"
	bind_to_port?: bool
}

#Listener_ConnectionBalanceConfig: {
	"@type": "type.googleapis.com/envoy.api.v2.Listener.ConnectionBalanceConfig"

	// oneof balance_type: exactly one must be set
	{exact_balance!: #Listener_ConnectionBalanceConfig_ExactBalance}
}

#Listener_ConnectionBalanceConfig_ExactBalance: {
	"@type": "type.googleapis.com/envoy.api.v2.Listener.ConnectionBalanceConfig.ExactBalance"
}

#Listener_DrainType: "DEFAULT" | "MODIFY_ONLY"
