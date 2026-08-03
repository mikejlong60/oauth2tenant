// Code generated from envoy/config/filter/http/gzip/v2/gzip.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/filter/http/compressor/v2"
)

#Gzip: {
	"@type":               "type.googleapis.com/envoy.config.filter.http.gzip.v2.Gzip"
	memory_level?:         uint32 & >=1 & <=9
	content_length?:       uint32
	compression_level?:    #Gzip_CompressionLevel_Enum
	compression_strategy?: #Gzip_CompressionStrategy
	content_type?: [...string]
	disable_on_etag_header?:        bool
	remove_accept_encoding_header?: bool
	window_bits?:                   uint32 & >=9 & <=15
	compressor?:                    v2_1.#Compressor
}

#Gzip_CompressionLevel: {
	"@type": "type.googleapis.com/envoy.config.filter.http.gzip.v2.Gzip.CompressionLevel"
}

#Gzip_CompressionLevel_Enum: "DEFAULT" | "BEST" | "SPEED"

#Gzip_CompressionStrategy: "DEFAULT" | "FILTERED" | "HUFFMAN" | "RLE"
