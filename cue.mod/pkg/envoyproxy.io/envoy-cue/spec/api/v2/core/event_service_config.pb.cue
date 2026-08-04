// Code generated from envoy/api/v2/core/event_service_config.proto. DO NOT EDIT.
package core

// [#not-implemented-hide:]
// Configuration of the event reporting service endpoint.
#EventServiceConfig: {
	"@type": "type.googleapis.com/envoy.api.v2.core.EventServiceConfig"

	// oneof config_source_specifier: exactly one must be set
	// Specifies the gRPC service that hosts the event reporting service.
	{grpc_service!: #GrpcService}
}
