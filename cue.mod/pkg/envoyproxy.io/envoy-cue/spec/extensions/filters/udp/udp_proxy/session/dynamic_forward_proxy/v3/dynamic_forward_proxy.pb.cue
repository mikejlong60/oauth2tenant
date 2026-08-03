// Code generated from envoy/extensions/filters/udp/udp_proxy/session/dynamic_forward_proxy/v3/dynamic_forward_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/dynamic_forward_proxy/v3"
)

#FilterConfig: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.session.dynamic_forward_proxy.v3.FilterConfig"
	stat_prefix!:      string & strings.MinRunes(1)
	dns_cache_config!: v3_1.#DnsCacheConfig
	buffer_options?:   #FilterConfig_BufferOptions
}

#FilterConfig_BufferOptions: {
	"@type":                 "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.session.dynamic_forward_proxy.v3.FilterConfig.BufferOptions"
	max_buffered_datagrams?: uint32
	max_buffered_bytes?:     uint64
}
