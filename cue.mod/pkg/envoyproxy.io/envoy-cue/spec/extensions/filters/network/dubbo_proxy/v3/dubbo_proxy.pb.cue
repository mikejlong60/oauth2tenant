// Code generated from envoy/extensions/filters/network/dubbo_proxy/v3/dubbo_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Drds: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.Drds"

	// Configuration source specifier.
	// In case of ``api_config_source`` only aggregated ``api_type`` is supported.
	config_source!: v3_1.#ConfigSource

	// The name of the multiple route configuration. This allows to use different multiple route
	// configurations. Tells which multiple route configuration should be fetched from the configuration
	// source. Leave unspecified is also valid and means the unnamed multiple route configuration.
	route_config_name?: string
}

// [#next-free-field: 8]
#DubboProxy: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.DubboProxy"

	// The human readable prefix to use when emitting statistics.
	stat_prefix!: string & strings.MinRunes(1)

	// Configure the protocol used.
	protocol_type?: #ProtocolType

	// Configure the serialization protocol used.
	serialization_type?: #SerializationType

	// The route table for the connection manager is static and is specified in this property.
	//
	// .. note::
	//
	//   This field is deprecated. Please use ``drds`` or ``multiple_route_config`` first.
	route_config?: [...#RouteConfiguration]

	// A list of individual Dubbo filters that make up the filter chain for requests made to the
	// Dubbo proxy. Order matters as the filters are processed sequentially. For backwards
	// compatibility, if no dubbo_filters are specified, a default Dubbo router filter
	// (``envoy.filters.dubbo.router``) is used.
	dubbo_filters?: [...#DubboFilter]

	// oneof route_specifier: at most one may be set
	*{} |
	{

		// Use xDS to fetch the route configuration. It is invalid to define both ``route_config`` and ``drds``.
		drds!: #Drds
	} |
	{multiple_route_config!: #MultipleRouteConfiguration}
}

// DubboFilter configures a Dubbo filter.
#DubboFilter: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.dubbo_proxy.v3.DubboFilter"

	// The name of the filter to instantiate. The name must match a supported
	// filter.
	name!: string & strings.MinRunes(1)

	// Filter specific configuration which depends on the filter being
	// instantiated. See the supported filters for further documentation.
	config?: {...}
}

// Dubbo Protocol types supported by Envoy.
#ProtocolType:
	// the default protocol.
	"Dubbo"

// Dubbo Serialization types supported by Envoy.
#SerializationType:
	// the default serialization protocol.
	"Hessian2"
