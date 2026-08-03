// Code generated from envoy/extensions/compression/zstd/compressor/v3/zstd.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Zstd: {
	"@type":            "type.googleapis.com/envoy.extensions.compression.zstd.compressor.v3.Zstd"
	compression_level?: uint32
	enable_checksum?:   bool
	strategy?:          #Zstd_Strategy
	dictionary?:        v3_1.#DataSource
	chunk_size?:        uint32 & >=4096 & <=65536
}

#Zstd_Strategy: "DEFAULT" | "FAST" | "DFAST" | "GREEDY" | "LAZY" | "LAZY2" | "BTLAZY2" | "BTOPT" | "BTULTRA" | "BTULTRA2"
