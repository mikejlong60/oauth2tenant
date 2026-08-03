// Code generated from envoy/config/trace/v3/skywalking.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#SkyWalkingConfig: {
	"@type":        "type.googleapis.com/envoy.config.trace.v3.SkyWalkingConfig"
	grpc_service!:  v3_1.#GrpcService
	client_config?: #ClientConfig
}

#ClientConfig: {
	"@type":         "type.googleapis.com/envoy.config.trace.v3.ClientConfig"
	service_name?:   string
	instance_name?:  string
	backend_token?:  string
	max_cache_size?: uint32
}
