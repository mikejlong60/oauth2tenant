// Code generated from envoy/extensions/filters/network/thrift_proxy/v3/thrift_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
)

#Trds: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.Trds"
	config_source!:     v3_1.#ConfigSource
	route_config_name?: string
}

#ThriftProxy: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.ThriftProxy"
	transport?:    #TransportType
	protocol?:     #ProtocolType
	stat_prefix!:  string & strings.MinRunes(1)
	route_config?: #RouteConfiguration
	trds?:         #Trds
	thrift_filters?: [...#ThriftFilter]
	payload_passthrough?:         bool
	max_requests_per_connection?: uint32
	access_log?: [...v3_2.#AccessLog]
	header_keys_preserve_case?: bool
}

#ThriftFilter: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.ThriftFilter"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
}

#ThriftProtocolOptions: {
	"@type":    "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.v3.ThriftProtocolOptions"
	transport?: #TransportType
	protocol?:  #ProtocolType
}

#TransportType: "AUTO_TRANSPORT" | "FRAMED" | "UNFRAMED" | "HEADER"

#ProtocolType: "AUTO_PROTOCOL" | "BINARY" | "LAX_BINARY" | "COMPACT" | "TWITTER"
