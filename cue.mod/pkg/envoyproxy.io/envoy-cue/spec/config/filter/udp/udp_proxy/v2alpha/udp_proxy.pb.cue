// Code generated from envoy/config/filter/udp/udp_proxy/v2alpha/udp_proxy.proto. DO NOT EDIT.
package v2alpha

#UdpProxyConfig: {
	"@type":       "type.googleapis.com/envoy.config.filter.udp.udp_proxy.v2alpha.UdpProxyConfig"
	stat_prefix!:  string & !=""
	idle_timeout?: string

	// oneof route_specifier: exactly one must be set
	{cluster!: string & !=""}
}
