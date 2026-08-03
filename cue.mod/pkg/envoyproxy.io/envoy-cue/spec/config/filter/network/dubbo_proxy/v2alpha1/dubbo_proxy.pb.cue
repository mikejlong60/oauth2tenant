// Code generated from envoy/config/filter/network/dubbo_proxy/v2alpha1/dubbo_proxy.proto. DO NOT EDIT.
package v2alpha1

#DubboProxy: {
	"@type":             "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.DubboProxy"
	stat_prefix!:        string & !=""
	protocol_type?:      #ProtocolType
	serialization_type?: #SerializationType
	route_config?: [...#RouteConfiguration]
	dubbo_filters?: [...#DubboFilter]
}

#DubboFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.network.dubbo_proxy.v2alpha1.DubboFilter"
	name!:   string & !=""
	config?: {...}
}

#ProtocolType: "Dubbo"

#SerializationType: "Hessian2"
