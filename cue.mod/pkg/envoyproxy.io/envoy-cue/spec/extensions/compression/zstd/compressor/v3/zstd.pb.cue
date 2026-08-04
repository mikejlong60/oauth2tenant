// Code generated from envoy/extensions/compression/zstd/compressor/v3/zstd.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// [#next-free-field: 6]
#Zstd: {
	"@type": "type.googleapis.com/envoy.extensions.compression.zstd.compressor.v3.Zstd"

	// Set compression parameters according to pre-defined compression level table.
	// Note that exact compression parameters are dynamically determined,
	// depending on both compression level and source content size (when known).
	// Value 0 means default, and default level is 3.
	// Setting a level does not automatically set all other compression parameters
	// to default. Setting this will however eventually dynamically impact the compression
	// parameters which have not been manually set. The manually set
	// ones will 'stick'.
	compression_level?: uint32

	// A 32-bits checksum of content is written at end of frame. If not set, defaults to false.
	enable_checksum?: bool

	// The higher the value of selected strategy, the more complex it is,
	// resulting in stronger and slower compression.
	// Special: value 0 means "use default strategy".
	strategy?: #Zstd_Strategy

	// A dictionary for compression. Zstd offers dictionary compression, which greatly improves
	// efficiency on small files and messages. Each dictionary will be generated with a dictionary ID
	// that can be used to search the same dictionary during decompression.
	// Please refer to `zstd manual <https://github.com/facebook/zstd/blob/dev/programs/zstd.1.md#dictionary-builder>`_
	// to train a specific dictionary for compression.
	dictionary?: v3_1.#DataSource

	// Value for compressor's next output buffer. If not set, defaults to 4096.
	chunk_size?: uint32 & >=4096 & <=65536
}

// Reference to http://facebook.github.io/zstd/zstd_manual.html
#Zstd_Strategy: "DEFAULT" | "FAST" | "DFAST" | "GREEDY" | "LAZY" | "LAZY2" | "BTLAZY2" | "BTOPT" | "BTULTRA" | "BTULTRA2"
