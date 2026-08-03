// Code generated from envoy/extensions/compression/brotli/decompressor/v3/brotli.proto. DO NOT EDIT.
package v3

#Brotli: {
	"@type":                           "type.googleapis.com/envoy.extensions.compression.brotli.decompressor.v3.Brotli"
	disable_ring_buffer_reallocation?: bool
	chunk_size?:                       uint32 & >=4096 & <=65536
}
