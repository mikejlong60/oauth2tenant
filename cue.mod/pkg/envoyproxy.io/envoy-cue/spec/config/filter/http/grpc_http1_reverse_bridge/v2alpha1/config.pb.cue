// Code generated from envoy/config/filter/http/grpc_http1_reverse_bridge/v2alpha1/config.proto. DO NOT EDIT.
package v2alpha1

#FilterConfig: {
	"@type":               "type.googleapis.com/envoy.config.filter.http.grpc_http1_reverse_bridge.v2alpha1.FilterConfig"
	content_type!:         string & !=""
	withhold_grpc_frames?: bool
}

#FilterConfigPerRoute: {
	"@type":   "type.googleapis.com/envoy.config.filter.http.grpc_http1_reverse_bridge.v2alpha1.FilterConfigPerRoute"
	disabled?: bool
}
