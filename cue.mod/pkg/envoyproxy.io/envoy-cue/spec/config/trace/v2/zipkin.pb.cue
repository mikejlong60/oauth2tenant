// Code generated from envoy/config/trace/v2/zipkin.proto. DO NOT EDIT.
package v2

// Configuration for the Zipkin tracer.
// [#extension: envoy.tracers.zipkin]
// [#next-free-field: 6]
#ZipkinConfig: {
	"@type": "type.googleapis.com/envoy.config.trace.v2.ZipkinConfig"

	// The cluster manager cluster that hosts the Zipkin collectors. Note that the
	// Zipkin cluster must be defined in the :ref:`Bootstrap static cluster
	// resources <envoy_api_field_config.bootstrap.v2.Bootstrap.StaticResources.clusters>`.
	collector_cluster!: string & !=""

	// The API endpoint of the Zipkin service where the spans will be sent. When
	// using a standard Zipkin installation, the API endpoint is typically
	// /api/v1/spans, which is the default value.
	collector_endpoint!: string & !=""

	// Determines whether a 128bit trace id will be used when creating a new
	// trace instance. The default value is false, which will result in a 64 bit trace id being used.
	trace_id_128bit?: bool

	// Determines whether client and server spans will share the same span context.
	// The default value is true.
	shared_span_context?: bool

	// Determines the selected collector endpoint version. By default, the ``HTTP_JSON_V1`` will be
	// used.
	collector_endpoint_version?: #ZipkinConfig_CollectorEndpointVersion
}

// Available Zipkin collector endpoint versions.
#ZipkinConfig_CollectorEndpointVersion:
	// Zipkin API v1, JSON over HTTP.
	// [#comment: The default implementation of Zipkin client before this field is added was only v1
	// and the way user configure this was by not explicitly specifying the version. Consequently,
	// before this is added, the corresponding Zipkin collector expected to receive v1 payload.
	// Hence the motivation of adding HTTP_JSON_V1 as the default is to avoid a breaking change when
	// user upgrading Envoy with this change. Furthermore, we also immediately deprecate this field,
	// since in Zipkin realm this v1 version is considered to be not preferable anymore.]
	"HTTP_JSON_V1" |

	// Zipkin API v2, JSON over HTTP.
	"HTTP_JSON" |

	// Zipkin API v2, protobuf over HTTP.
	"HTTP_PROTO" |

	// [#not-implemented-hide:]
	"GRPC"
