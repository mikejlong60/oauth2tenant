// Code generated from envoy/config/ratelimit/v3/rls.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#RateLimitServiceConfig: {
	"@type":                "type.googleapis.com/envoy.config.ratelimit.v3.RateLimitServiceConfig"
	grpc_service!:          v3_1.#GrpcService
	transport_api_version?: v3_1.#ApiVersion
}
