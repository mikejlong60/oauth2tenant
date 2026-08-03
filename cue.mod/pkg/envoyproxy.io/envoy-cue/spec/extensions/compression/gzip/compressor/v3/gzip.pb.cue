// Code generated from envoy/extensions/compression/gzip/compressor/v3/gzip.proto. DO NOT EDIT.
package v3

#Gzip: {
	"@type":               "type.googleapis.com/envoy.extensions.compression.gzip.compressor.v3.Gzip"
	memory_level?:         uint32 & >=1 & <=9
	compression_level?:    #Gzip_CompressionLevel
	compression_strategy?: #Gzip_CompressionStrategy
	window_bits?:          uint32 & >=9 & <=15
	chunk_size?:           uint32 & >=4096 & <=65536
}

#Gzip_CompressionStrategy: "DEFAULT_STRATEGY" | "FILTERED" | "HUFFMAN_ONLY" | "RLE" | "FIXED"

#Gzip_CompressionLevel: "DEFAULT_COMPRESSION" | "BEST_SPEED" | "COMPRESSION_LEVEL_1" | "COMPRESSION_LEVEL_2" | "COMPRESSION_LEVEL_3" | "COMPRESSION_LEVEL_4" | "COMPRESSION_LEVEL_5" | "COMPRESSION_LEVEL_6" | "COMPRESSION_LEVEL_7" | "COMPRESSION_LEVEL_8" | "COMPRESSION_LEVEL_9" | "BEST_COMPRESSION"
