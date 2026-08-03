// Code generated from envoy/extensions/filters/http/compressor/v3/compressor.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Compressor: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.compressor.v3.Compressor"
	content_length?: uint32
	content_type?: [...string]
	disable_on_etag_header?:        bool
	remove_accept_encoding_header?: bool
	runtime_enabled?:               v3_1.#RuntimeFeatureFlag
	compressor_library!:            v3_1.#TypedExtensionConfig
	request_direction_config?:      #Compressor_RequestDirectionConfig
	response_direction_config?:     #Compressor_ResponseDirectionConfig
	choose_first?:                  bool
}

#Compressor_CommonDirectionConfig: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.http.compressor.v3.Compressor.CommonDirectionConfig"
	enabled?:            v3_1.#RuntimeFeatureFlag
	min_content_length?: uint32
	content_type?: [...string]
}

#Compressor_RequestDirectionConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.compressor.v3.Compressor.RequestDirectionConfig"
	common_config?: #Compressor_CommonDirectionConfig
}

#Compressor_ResponseDirectionConfig: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.http.compressor.v3.Compressor.ResponseDirectionConfig"
	common_config?:                 #Compressor_CommonDirectionConfig
	disable_on_etag_header?:        bool
	remove_accept_encoding_header?: bool
	uncompressible_response_codes?: [...uint32] // TODO(pgv): repeated.unique
	status_header_enabled?:                     bool
}

#ResponseDirectionOverrides: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.http.compressor.v3.ResponseDirectionOverrides"
	remove_accept_encoding_header?: bool
}

#CompressorOverrides: {
	"@type":                    "type.googleapis.com/envoy.extensions.filters.http.compressor.v3.CompressorOverrides"
	response_direction_config?: #ResponseDirectionOverrides
	compressor_library?:        v3_1.#TypedExtensionConfig
}

#CompressorPerRoute: {
	"@type":    "type.googleapis.com/envoy.extensions.filters.http.compressor.v3.CompressorPerRoute"
	disabled!:  bool & true
	overrides?: #CompressorOverrides
}
