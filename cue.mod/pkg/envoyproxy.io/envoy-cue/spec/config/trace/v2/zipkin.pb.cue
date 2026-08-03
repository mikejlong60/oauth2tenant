// Code generated from envoy/config/trace/v2/zipkin.proto. DO NOT EDIT.
package v2

#ZipkinConfig: {
	"@type":                     "type.googleapis.com/envoy.config.trace.v2.ZipkinConfig"
	collector_cluster!:          string & !=""
	collector_endpoint!:         string & !=""
	trace_id_128bit?:            bool
	shared_span_context?:        bool
	collector_endpoint_version?: #ZipkinConfig_CollectorEndpointVersion
}

#ZipkinConfig_CollectorEndpointVersion: "HTTP_JSON_V1" | "HTTP_JSON" | "HTTP_PROTO" | "GRPC"
