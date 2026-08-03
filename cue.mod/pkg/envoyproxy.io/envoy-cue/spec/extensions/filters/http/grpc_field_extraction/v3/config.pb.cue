// Code generated from envoy/extensions/filters/http/grpc_field_extraction/v3/config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#GrpcFieldExtractionConfig: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.grpc_field_extraction.v3.GrpcFieldExtractionConfig"
	descriptor_set!: v3_1.#DataSource
	extractions_by_method?: {[string]: #FieldExtractions}
}

#FieldExtractions: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.grpc_field_extraction.v3.FieldExtractions"
	request_field_extractions?: {[string]: #RequestFieldValueDisposition}
}

#RequestFieldValueDisposition: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.http.grpc_field_extraction.v3.RequestFieldValueDisposition"
	dynamic_metadata?: string
}
