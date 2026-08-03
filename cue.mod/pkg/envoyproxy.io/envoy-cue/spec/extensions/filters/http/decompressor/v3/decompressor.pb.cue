// Code generated from envoy/extensions/filters/http/decompressor/v3/decompressor.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Decompressor: {
	"@type":                    "type.googleapis.com/envoy.extensions.filters.http.decompressor.v3.Decompressor"
	decompressor_library!:      v3_1.#TypedExtensionConfig
	request_direction_config?:  #Decompressor_RequestDirectionConfig
	response_direction_config?: #Decompressor_ResponseDirectionConfig
}

#Decompressor_CommonDirectionConfig: {
	"@type":                     "type.googleapis.com/envoy.extensions.filters.http.decompressor.v3.Decompressor.CommonDirectionConfig"
	enabled?:                    v3_1.#RuntimeFeatureFlag
	ignore_no_transform_header?: bool
}

#Decompressor_RequestDirectionConfig: {
	"@type":                    "type.googleapis.com/envoy.extensions.filters.http.decompressor.v3.Decompressor.RequestDirectionConfig"
	common_config?:             #Decompressor_CommonDirectionConfig
	advertise_accept_encoding?: bool
}

#Decompressor_ResponseDirectionConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.decompressor.v3.Decompressor.ResponseDirectionConfig"
	common_config?: #Decompressor_CommonDirectionConfig
}
