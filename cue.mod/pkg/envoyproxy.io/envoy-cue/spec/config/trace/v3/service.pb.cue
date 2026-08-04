// Code generated from envoy/config/trace/v3/service.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Configuration structure.
#TraceServiceConfig: {
	"@type": "type.googleapis.com/envoy.config.trace.v3.TraceServiceConfig"

	// The upstream gRPC cluster that hosts the metrics service.
	grpc_service!: v3_1.#GrpcService
}
