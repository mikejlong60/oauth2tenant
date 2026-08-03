// Code generated from envoy/extensions/compression/zstd/decompressor/v3/zstd.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Zstd: {
	"@type": "type.googleapis.com/envoy.extensions.compression.zstd.decompressor.v3.Zstd"
	dictionaries?: [...v3_1.#DataSource]
	chunk_size?: uint32 & >=4096 & <=65536
}
