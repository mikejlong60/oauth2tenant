// Code generated from envoy/extensions/filters/udp/udp_proxy/v3/udp_proxy.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
)

#UdpProxyConfig: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.UdpProxyConfig"
	stat_prefix!:         string & strings.MinRunes(1)
	cluster!:             string & strings.MinRunes(1)
	matcher?:             v3_1.#Matcher
	idle_timeout?:        string
	use_original_src_ip?: bool
	hash_policies?: [...#UdpProxyConfig_HashPolicy] & list.MaxItems(1)
	upstream_socket_config?:        v3_2.#UdpSocketConfig
	use_per_packet_load_balancing?: bool
	access_log?: [...v3_3.#AccessLog]
	proxy_access_log?: [...v3_3.#AccessLog]
	session_filters?: [...#UdpProxyConfig_SessionFilter]
	tunneling_config?:   #UdpProxyConfig_UdpTunnelingConfig
	access_log_options?: #UdpProxyConfig_UdpAccessLogOptions
}

#UdpProxyConfig_HashPolicy: {
	"@type":    "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.UdpProxyConfig.HashPolicy"
	source_ip!: bool & true
	key!:       string & strings.MinRunes(1)
}

#UdpProxyConfig_SessionFilter: {
	"@type": "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.UdpProxyConfig.SessionFilter"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
	config_discovery?: v3_2.#ExtensionConfigSource
}

#UdpProxyConfig_UdpTunnelingConfig: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.UdpProxyConfig.UdpTunnelingConfig"
	proxy_host!:          string & strings.MinRunes(1)
	proxy_port?:          uint32
	target_host!:         string & strings.MinRunes(1)
	default_target_port?: uint32 & >0 & <=65535
	use_post?:            bool
	post_path?:           string
	retry_options?:       #UdpProxyConfig_UdpTunnelingConfig_RetryOptions
	headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
	buffer_options?:              #UdpProxyConfig_UdpTunnelingConfig_BufferOptions
	propagate_response_headers?:  bool
	propagate_response_trailers?: bool
}

#UdpProxyConfig_UdpTunnelingConfig_BufferOptions: {
	"@type":                 "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.UdpProxyConfig.UdpTunnelingConfig.BufferOptions"
	max_buffered_datagrams?: uint32
	max_buffered_bytes?:     uint64
}

#UdpProxyConfig_UdpTunnelingConfig_RetryOptions: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.UdpProxyConfig.UdpTunnelingConfig.RetryOptions"
	max_connect_attempts?: uint32
	backoff_options?:      v3_2.#BackoffStrategy
}

#UdpProxyConfig_UdpAccessLogOptions: {
	"@type":                               "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.UdpProxyConfig.UdpAccessLogOptions"
	access_log_flush_interval?:            string // TODO(pgv): duration bounds
	flush_access_log_on_tunnel_connected?: bool
}
