// Code generated from envoy/config/filter/http/compressor/v2/compressor.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#Compressor: {
	"@type":         "type.googleapis.com/envoy.config.filter.http.compressor.v2.Compressor"
	content_length?: uint32
	content_type?: [...string]
	disable_on_etag_header?:        bool
	remove_accept_encoding_header?: bool
	runtime_enabled?:               core_1.#RuntimeFeatureFlag
}
