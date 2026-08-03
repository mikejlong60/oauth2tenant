// Code generated from envoy/extensions/access_loggers/grpc/v3/als.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/tracing/v3"
)

#HttpGrpcAccessLogConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.access_loggers.grpc.v3.HttpGrpcAccessLogConfig"
	common_config!: #CommonGrpcAccessLogConfig
	additional_request_headers_to_log?: [...string]
	additional_response_headers_to_log?: [...string]
	additional_response_trailers_to_log?: [...string]
}

#TcpGrpcAccessLogConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.access_loggers.grpc.v3.TcpGrpcAccessLogConfig"
	common_config!: #CommonGrpcAccessLogConfig
}

#CommonGrpcAccessLogConfig: {
	"@type":                "type.googleapis.com/envoy.extensions.access_loggers.grpc.v3.CommonGrpcAccessLogConfig"
	log_name!:              string & strings.MinRunes(1)
	grpc_service!:          v3_1.#GrpcService
	transport_api_version?: v3_1.#ApiVersion
	buffer_flush_interval?: string // TODO(pgv): duration bounds
	buffer_size_bytes?:     uint32
	filter_state_objects_to_log?: [...string]
	grpc_stream_retry_policy?: v3_1.#RetryPolicy
	custom_tags?: [...v3_2.#CustomTag]
}
