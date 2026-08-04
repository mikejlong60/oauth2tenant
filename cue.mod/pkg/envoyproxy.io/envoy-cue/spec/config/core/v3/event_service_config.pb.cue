// Code generated from envoy/config/core/v3/event_service_config.proto. DO NOT EDIT.
package v3

// [#not-implemented-hide:]
// Configuration of the event reporting service endpoint.
#EventServiceConfig: {
	"@type": "type.googleapis.com/envoy.config.core.v3.EventServiceConfig"

	// oneof config_source_specifier: exactly one must be set
	// Specifies the gRPC service that hosts the event reporting service.
	{grpc_service!: #GrpcService}
}
