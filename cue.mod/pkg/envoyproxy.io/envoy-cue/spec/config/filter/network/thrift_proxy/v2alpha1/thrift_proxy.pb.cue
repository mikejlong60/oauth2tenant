// Code generated from envoy/config/filter/network/thrift_proxy/v2alpha1/thrift_proxy.proto. DO NOT EDIT.
package v2alpha1

// [#next-free-field: 6]
#ThriftProxy: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.ThriftProxy"

	// Supplies the type of transport that the Thrift proxy should use. Defaults to
	// :ref:`AUTO_TRANSPORT<envoy_api_enum_value_config.filter.network.thrift_proxy.v2alpha1.TransportType.AUTO_TRANSPORT>`.
	transport?: #TransportType

	// Supplies the type of protocol that the Thrift proxy should use. Defaults to
	// :ref:`AUTO_PROTOCOL<envoy_api_enum_value_config.filter.network.thrift_proxy.v2alpha1.ProtocolType.AUTO_PROTOCOL>`.
	protocol?: #ProtocolType

	// The human readable prefix to use when emitting statistics.
	stat_prefix!: string & !=""

	// The route table for the connection manager is static and is specified in this property.
	route_config?: #RouteConfiguration

	// A list of individual Thrift filters that make up the filter chain for requests made to the
	// Thrift proxy. Order matters as the filters are processed sequentially. For backwards
	// compatibility, if no thrift_filters are specified, a default Thrift router filter
	// (`envoy.filters.thrift.router`) is used.
	thrift_filters?: [...#ThriftFilter]
}

// ThriftFilter configures a Thrift filter.
#ThriftFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.ThriftFilter"

	// The name of the filter to instantiate. The name must match a supported
	// filter. The built-in filters are:
	//
	// [#comment:TODO(zuercher): Auto generate the following list]
	// * :ref:`envoy.filters.thrift.router <config_thrift_filters_router>`
	// * :ref:`envoy.filters.thrift.rate_limit <config_thrift_filters_rate_limit>`
	name!: string & !=""

	// Filter specific configuration which depends on the filter being instantiated. See the supported
	// filters for further documentation.
	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

// ThriftProtocolOptions specifies Thrift upstream protocol options. This object is used in
// in
// :ref:`typed_extension_protocol_options<envoy_api_field_Cluster.typed_extension_protocol_options>`,
// keyed by the name `envoy.filters.network.thrift_proxy`.
#ThriftProtocolOptions: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.ThriftProtocolOptions"

	// Supplies the type of transport that the Thrift proxy should use for upstream connections.
	// Selecting
	// :ref:`AUTO_TRANSPORT<envoy_api_enum_value_config.filter.network.thrift_proxy.v2alpha1.TransportType.AUTO_TRANSPORT>`,
	// which is the default, causes the proxy to use the same transport as the downstream connection.
	transport?: #TransportType

	// Supplies the type of protocol that the Thrift proxy should use for upstream connections.
	// Selecting
	// :ref:`AUTO_PROTOCOL<envoy_api_enum_value_config.filter.network.thrift_proxy.v2alpha1.ProtocolType.AUTO_PROTOCOL>`,
	// which is the default, causes the proxy to use the same protocol as the downstream connection.
	protocol?: #ProtocolType
}

// Thrift transport types supported by Envoy.
#TransportType:
	// For downstream connections, the Thrift proxy will attempt to determine which transport to use.
	// For upstream connections, the Thrift proxy will use same transport as the downstream
	// connection.
	"AUTO_TRANSPORT" |

	// The Thrift proxy will use the Thrift framed transport.
	"FRAMED" |

	// The Thrift proxy will use the Thrift unframed transport.
	"UNFRAMED" |

	// The Thrift proxy will assume the client is using the Thrift header transport.
	"HEADER"

// Thrift Protocol types supported by Envoy.
#ProtocolType:
	// For downstream connections, the Thrift proxy will attempt to determine which protocol to use.
	// Note that the older, non-strict (or lax) binary protocol is not included in automatic protocol
	// detection. For upstream connections, the Thrift proxy will use the same protocol as the
	// downstream connection.
	"AUTO_PROTOCOL" |

	// The Thrift proxy will use the Thrift binary protocol.
	"BINARY" |

	// The Thrift proxy will use Thrift non-strict binary protocol.
	"LAX_BINARY" |

	// The Thrift proxy will use the Thrift compact protocol.
	"COMPACT" |

	// The Thrift proxy will use the Thrift "Twitter" protocol implemented by the finagle library.
	"TWITTER"
