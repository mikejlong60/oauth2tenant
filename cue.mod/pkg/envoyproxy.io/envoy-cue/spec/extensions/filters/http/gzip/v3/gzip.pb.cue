// Code generated from envoy/extensions/filters/http/gzip/v3/gzip.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/http/compressor/v3"
)

#Gzip: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.gzip.v3.Gzip"
	memory_level?:         uint32 & >=1 & <=9
	compression_level?:    #Gzip_CompressionLevel_Enum
	compression_strategy?: #Gzip_CompressionStrategy
	window_bits?:          uint32 & >=9 & <=15
	compressor?:           v3_1.#Compressor
	chunk_size?:           uint32 & >=4096 & <=65536
}

#Gzip_CompressionLevel: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.gzip.v3.Gzip.CompressionLevel"
}

#Gzip_CompressionLevel_Enum: "DEFAULT" | "BEST" | "SPEED"

#Gzip_CompressionStrategy: "DEFAULT" | "FILTERED" | "HUFFMAN" | "RLE"
