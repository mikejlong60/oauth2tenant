// Code generated from envoy/extensions/filters/http/proto_message_extraction/v3/config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ProtoMessageExtractionConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.proto_message_extraction.v3.ProtoMessageExtractionConfig"
	mode?:   #ProtoMessageExtractionConfig_ExtractMode

	// Specify the message extraction info.
	// The key is the fully qualified gRPC method name.
	// ``${package}.${Service}.${Method}``, like
	// ``endpoints.examples.bookstore.BookStore.GetShelf``
	//
	// The value is the message extraction information for individual gRPC
	// methods.
	extraction_by_method?: {[string]: #MethodExtraction}

	// The proto descriptor set binary for the gRPC services.
	// oneof descriptor_set: at most one may be set
	*{} |
	{

		// It could be passed by a local file through ``Datasource.filename`` or
		// embedded in the ``Datasource.inline_bytes``.
		data_source!: v3_1.#DataSource
	} |
	{

		// Unimplemented, the key of proto descriptor TypedMetadata.
		// Among filters depending on the proto descriptor, we can have a
		// TypedMetadata for proto descriptors, so that these filters can share one
		// copy of proto descriptor in memory.
		proto_descriptor_typed_metadata!: string
	}
}

#ProtoMessageExtractionConfig_ExtractMode:
	"ExtractMode_UNSPECIFIED" |

	// The filter will extract the first and the last message for
	// for streaming cases, containing
	// client-side streaming, server-side streaming or bi-directional streaming.
	"FIRST_AND_LAST"

// This message can be used to support per route config approach later even
// though the Istio doesn't support that so far.
#MethodExtraction: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.proto_message_extraction.v3.MethodExtraction"

	// The mapping of field path to its ExtractDirective for request messages
	request_extraction_by_field?: {[string]: #MethodExtraction_ExtractDirective}

	// The mapping of field path to its ExtractDirective for response messages
	response_extraction_by_field?: {[string]: #MethodExtraction_ExtractDirective}
}

#MethodExtraction_ExtractDirective:
	"ExtractDirective_UNSPECIFIED" |

	// The value of this field will be extracted.
	"EXTRACT" |

	// It should be only annotated on Message type fields so if the field isn't
	// empty, an empty Struct will be extracted.
	"EXTRACT_REDACT" |

	// Extract a repeated top-level field and record its number of entries in
	// the extraction result. Can be applied to at most one field in the
	// response, and cannot be applied to any fields in the request.
	"EXTRACT_REPEATED_CARDINALITY"
