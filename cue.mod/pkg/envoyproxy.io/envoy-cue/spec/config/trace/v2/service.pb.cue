// Code generated from envoy/config/trace/v2/service.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

// Configuration structure.
#TraceServiceConfig: {
	"@type": "type.googleapis.com/envoy.config.trace.v2.TraceServiceConfig"

	// The upstream gRPC cluster that hosts the metrics service.
	grpc_service!: core_1.#GrpcService
}
