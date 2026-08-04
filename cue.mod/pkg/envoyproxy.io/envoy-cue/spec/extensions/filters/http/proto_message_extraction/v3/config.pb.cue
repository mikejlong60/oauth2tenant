// Code generated from envoy/extensions/filters/http/proto_message_extraction/v3/config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ProtoMessageExtractionConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.proto_message_extraction.v3.ProtoMessageExtractionConfig"
	mode?:   #ProtoMessageExtractionConfig_ExtractMode
	extraction_by_method?: {[string]: #MethodExtraction}

	// oneof descriptor_set: at most one may be set
	*{} |
	{data_source!: v3_1.#DataSource} |
	{proto_descriptor_typed_metadata!: string}
}

#ProtoMessageExtractionConfig_ExtractMode: "ExtractMode_UNSPECIFIED" | "FIRST_AND_LAST"

#MethodExtraction: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.proto_message_extraction.v3.MethodExtraction"
	request_extraction_by_field?: {[string]: #MethodExtraction_ExtractDirective}
	response_extraction_by_field?: {[string]: #MethodExtraction_ExtractDirective}
}

#MethodExtraction_ExtractDirective: "ExtractDirective_UNSPECIFIED" | "EXTRACT" | "EXTRACT_REDACT" | "EXTRACT_REPEATED_CARDINALITY"
