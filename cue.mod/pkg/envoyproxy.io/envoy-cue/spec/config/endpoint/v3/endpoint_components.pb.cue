// Code generated from envoy/config/endpoint/v3/endpoint_components.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

// Upstream host identifier.
#Endpoint: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.Endpoint"

	// The upstream host address.
	//
	// .. attention::
	//
	//   The form of host address depends on the given cluster type. For STATIC or EDS,
	//   it is expected to be a direct IP address (or something resolvable by the
	//   specified :ref:`resolver <envoy_v3_api_field_config.core.v3.SocketAddress.resolver_name>`
	//   in the Address). For LOGICAL or STRICT DNS, it is expected to be hostname,
	//   and will be resolved via DNS.
	address?: v3_1.#Address

	// The optional health check configuration is used as configuration for the
	// health checker to contact the health checked host.
	//
	// .. attention::
	//
	//   This takes into effect only for upstream clusters with
	//   :ref:`active health checking <arch_overview_health_checking>` enabled.
	health_check_config?: #Endpoint_HealthCheckConfig

	// The hostname associated with this endpoint. This hostname is not used for routing or address
	// resolution. If provided, it will be associated with the endpoint, and can be used for features
	// that require a hostname, like
	// :ref:`auto_host_rewrite <envoy_v3_api_field_config.route.v3.RouteAction.auto_host_rewrite>`.
	hostname?: string

	// An ordered list of addresses that together with ``address`` comprise the
	// list of addresses for an endpoint. The address given in the ``address`` is
	// prepended to this list. It is assumed that the list must already be
	// sorted by preference order of the addresses. This will only be supported
	// for STATIC and EDS clusters.
	additional_addresses?: [...#Endpoint_AdditionalAddress]
}

// The optional health check configuration.
#Endpoint_HealthCheckConfig: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.Endpoint.HealthCheckConfig"

	// Optional alternative health check port value.
	//
	// By default the health check address port of an upstream host is the same
	// as the host's serving address port. This provides an alternative health
	// check port. Setting this with a non-zero value allows an upstream host
	// to have different health check address port.
	port_value?: uint32 & <=65535

	// By default, the host header for L7 health checks is controlled by cluster level configuration
	// (see: :ref:`host <envoy_v3_api_field_config.core.v3.HealthCheck.HttpHealthCheck.host>` and
	// :ref:`authority <envoy_v3_api_field_config.core.v3.HealthCheck.GrpcHealthCheck.authority>`). Setting this
	// to a non-empty value allows overriding the cluster level configuration for a specific
	// endpoint.
	hostname?: string

	// Optional alternative health check host address.
	//
	// .. attention::
	//
	//   The form of the health check host address is expected to be a direct IP address.
	address?: v3_1.#Address

	// Optional flag to control if perform active health check for this endpoint.
	// Active health check is enabled by default if there is a health checker.
	disable_active_health_check?: bool
}

#Endpoint_AdditionalAddress: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.Endpoint.AdditionalAddress"

	// Additional address that is associated with the endpoint.
	address?: v3_1.#Address
}

// An Endpoint that Envoy can route traffic to.
// [#next-free-field: 6]
#LbEndpoint: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.LbEndpoint"

	// Optional health status when known and supplied by EDS server.
	health_status?: v3_1.#HealthStatus

	// The endpoint metadata specifies values that may be used by the load
	// balancer to select endpoints in a cluster for a given request. The filter
	// name should be specified as ``envoy.lb``. An example boolean key-value pair
	// is ``canary``, providing the optional canary status of the upstream host.
	// This may be matched against in a route's
	// :ref:`RouteAction <envoy_v3_api_msg_config.route.v3.RouteAction>` metadata_match field
	// to subset the endpoints considered in cluster load balancing.
	metadata?: v3_1.#Metadata

	// The optional load balancing weight of the upstream host; at least 1.
	// Envoy uses the load balancing weight in some of the built in load
	// balancers. The load balancing weight for an endpoint is divided by the sum
	// of the weights of all endpoints in the endpoint's locality to produce a
	// percentage of traffic for the endpoint. This percentage is then further
	// weighted by the endpoint's locality's load balancing weight from
	// LocalityLbEndpoints. If unspecified, will be treated as 1. The sum
	// of the weights of all endpoints in the endpoint's locality must not
	// exceed uint32_t maximal value (4294967295).
	load_balancing_weight?: uint32 & >=1

	// Upstream host identifier or a named reference.
	// oneof host_identifier: at most one may be set
	*{} |
	{endpoint!: #Endpoint} |
	{

		// [#not-implemented-hide:]
		endpoint_name!: string
	}
}

// LbEndpoint list collection. Entries are `LbEndpoint` resources or references.
// [#not-implemented-hide:]
#LbEndpointCollection: {
	"@type":  "type.googleapis.com/envoy.config.endpoint.v3.LbEndpointCollection"
	entries?: v3_2.#CollectionEntry
}

// A configuration for an LEDS collection.
#LedsClusterLocalityConfig: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.LedsClusterLocalityConfig"

	// Configuration for the source of LEDS updates for a Locality.
	leds_config?: v3_1.#ConfigSource

	// The name of the LbEndpoint collection resource.
	//
	// If the name ends in ``/*``, it indicates an LbEndpoint glob collection,
	// which is supported only in the xDS incremental protocol variants.
	// Otherwise, it indicates an LbEndpointCollection list collection.
	//
	// Envoy currently supports only glob collections.
	leds_collection_name?: string
}

// A group of endpoints belonging to a Locality.
// One can have multiple LocalityLbEndpoints for a locality, but only if
// they have different priorities.
// [#next-free-field: 10]
#LocalityLbEndpoints: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.LocalityLbEndpoints"

	// Identifies location of where the upstream hosts run.
	locality?: v3_1.#Locality

	// Metadata to provide additional information about the locality endpoints in aggregate.
	metadata?: v3_1.#Metadata

	// The group of endpoints belonging to the locality specified.
	// This is ignored if :ref:`leds_cluster_locality_config
	// <envoy_v3_api_field_config.endpoint.v3.LocalityLbEndpoints.leds_cluster_locality_config>` is set.
	lb_endpoints?: [...#LbEndpoint]

	// Optional: Per priority/region/zone/sub_zone weight; at least 1. The load
	// balancing weight for a locality is divided by the sum of the weights of all
	// localities  at the same priority level to produce the effective percentage
	// of traffic for the locality. The sum of the weights of all localities at
	// the same priority level must not exceed uint32_t maximal value (4294967295).
	//
	// Locality weights are only considered when :ref:`locality weighted load
	// balancing <arch_overview_load_balancing_locality_weighted_lb>` is
	// configured. These weights are ignored otherwise. If no weights are
	// specified when locality weighted load balancing is enabled, the locality is
	// assigned no load.
	load_balancing_weight?: uint32 & >=1

	// Optional: the priority for this LocalityLbEndpoints. If unspecified this will
	// default to the highest priority (0).
	//
	// Under usual circumstances, Envoy will only select endpoints for the highest
	// priority (0). In the event that enough endpoints for a particular priority are
	// unavailable/unhealthy, Envoy will fail over to selecting endpoints for the
	// next highest priority group. Read more at :ref:`priority levels <arch_overview_load_balancing_priority_levels>`.
	//
	// Priorities should range from 0 (highest) to N (lowest) without skipping.
	priority?: uint32 & <=128

	// Optional: Per locality proximity value which indicates how close this
	// locality is from the source locality. This value only provides ordering
	// information (lower the value, closer it is to the source locality).
	// This will be consumed by load balancing schemes that need proximity order
	// to determine where to route the requests.
	// [#not-implemented-hide:]
	proximity?: uint32

	// oneof lb_config: at most one may be set
	*{} |
	{

		// [#not-implemented-hide:]
		// Not implemented and deprecated.
		load_balancer_endpoints!: #LocalityLbEndpoints_LbEndpointList
	} |
	{

		// LEDS Configuration for the current locality.
		// If this is set, the :ref:`lb_endpoints
		// <envoy_v3_api_field_config.endpoint.v3.LocalityLbEndpoints.lb_endpoints>`
		// field is ignored.
		leds_cluster_locality_config!: #LedsClusterLocalityConfig
	}
}

// [#not-implemented-hide:]
// A list of endpoints of a specific locality.
#LocalityLbEndpoints_LbEndpointList: {
	"@type": "type.googleapis.com/envoy.config.endpoint.v3.LocalityLbEndpoints.LbEndpointList"
	lb_endpoints?: [...#LbEndpoint]
}
