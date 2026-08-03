// Code generated from envoy/extensions/compression/brotli/compressor/v3/brotli.proto. DO NOT EDIT.
package v3

#Brotli: {
	"@type":                           "type.googleapis.com/envoy.extensions.compression.brotli.compressor.v3.Brotli"
	quality?:                          uint32 & <=11
	encoder_mode?:                     #Brotli_EncoderMode
	window_bits?:                      uint32 & >=10 & <=24
	input_block_bits?:                 uint32 & >=16 & <=24
	chunk_size?:                       uint32 & >=4096 & <=65536
	disable_literal_context_modeling?: bool
}

#Brotli_EncoderMode: "DEFAULT" | "GENERIC" | "TEXT" | "FONT"
