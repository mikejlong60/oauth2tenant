// Code generated from envoy/config/filter/network/thrift_proxy/v2alpha1/thrift_proxy.proto. DO NOT EDIT.
package v2alpha1

#ThriftProxy: {
	"@type":       "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.ThriftProxy"
	transport?:    #TransportType
	protocol?:     #ProtocolType
	stat_prefix!:  string & !=""
	route_config?: #RouteConfiguration
	thrift_filters?: [...#ThriftFilter]
}

#ThriftFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.ThriftFilter"
	name!:   string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#ThriftProtocolOptions: {
	"@type":    "type.googleapis.com/envoy.config.filter.network.thrift_proxy.v2alpha1.ThriftProtocolOptions"
	transport?: #TransportType
	protocol?:  #ProtocolType
}

#TransportType: "AUTO_TRANSPORT" | "FRAMED" | "UNFRAMED" | "HEADER"

#ProtocolType: "AUTO_PROTOCOL" | "BINARY" | "LAX_BINARY" | "COMPACT" | "TWITTER"
