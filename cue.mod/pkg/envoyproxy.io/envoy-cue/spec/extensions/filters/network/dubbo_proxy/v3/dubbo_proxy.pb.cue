// Code generated from envoy/extensions/filters/network/dubbo_proxy/v3/dubbo_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Drds: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.Drds"
	config_source!:     v3_1.#ConfigSource
	route_config_name?: string
}

#DubboProxy: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.DubboProxy"
	stat_prefix!:        string & strings.MinRunes(1)
	protocol_type?:      #ProtocolType
	serialization_type?: #SerializationType
	route_config?: [...#RouteConfiguration]
	dubbo_filters?: [...#DubboFilter]

	// oneof route_specifier: at most one may be set
	*{} |
	{drds!: #Drds} |
	{multiple_route_config!: #MultipleRouteConfiguration}
}

#DubboFilter: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.DubboFilter"
	name!:   string & strings.MinRunes(1)
	config?: {...}
}

#ProtocolType: "Dubbo"

#SerializationType: "Hessian2"
