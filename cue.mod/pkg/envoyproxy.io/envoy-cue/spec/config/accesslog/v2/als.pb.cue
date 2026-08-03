// Code generated from envoy/config/accesslog/v2/als.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#HttpGrpcAccessLogConfig: {
	"@type":        "type.googleapis.com/envoy.config.accesslog.v2.HttpGrpcAccessLogConfig"
	common_config!: #CommonGrpcAccessLogConfig
	additional_request_headers_to_log?: [...string]
	additional_response_headers_to_log?: [...string]
	additional_response_trailers_to_log?: [...string]
}

#TcpGrpcAccessLogConfig: {
	"@type":        "type.googleapis.com/envoy.config.accesslog.v2.TcpGrpcAccessLogConfig"
	common_config!: #CommonGrpcAccessLogConfig
}

#CommonGrpcAccessLogConfig: {
	"@type":                "type.googleapis.com/envoy.config.accesslog.v2.CommonGrpcAccessLogConfig"
	log_name!:              string & !=""
	grpc_service!:          core_1.#GrpcService
	buffer_flush_interval?: string // TODO(pgv): duration bounds
	buffer_size_bytes?:     uint32
	filter_state_objects_to_log?: [...string]
}
