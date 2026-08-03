// Code generated from envoy/extensions/compression/gzip/decompressor/v3/gzip.proto. DO NOT EDIT.
package v3

#Gzip: {
	"@type":            "type.googleapis.com/envoy.extensions.compression.gzip.decompressor.v3.Gzip"
	window_bits?:       uint32 & >=9 & <=15
	chunk_size?:        uint32 & >=4096 & <=65536
	max_inflate_ratio?: uint32 & >=1 & <=1032
}
