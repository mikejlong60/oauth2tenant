// Code generated from envoy/extensions/compression/gzip/compressor/v3/gzip.proto. DO NOT EDIT.
package v3

// [#next-free-field: 6]
#Gzip: {
	"@type": "type.googleapis.com/envoy.extensions.compression.gzip.compressor.v3.Gzip"

	// Value from 1 to 9 that controls the amount of internal memory used by zlib. Higher values
	// use more memory, but are faster and produce better compression results.
	//
	// Defaults to ``5``.
	memory_level?: uint32 & >=1 & <=9

	// A value used for selecting the zlib compression level. This setting will affect speed and
	// amount of compression applied to the content. ``BEST_COMPRESSION`` provides higher compression
	// at the cost of higher latency and is equal to ``COMPRESSION_LEVEL_9``. ``BEST_SPEED`` provides
	// lower compression with minimum impact on response time, the same as ``COMPRESSION_LEVEL_1``.
	// ``DEFAULT_COMPRESSION`` provides an optimal result between speed and compression. According
	// to zlib's manual, this level gives the same result as ``COMPRESSION_LEVEL_6``.
	//
	// Defaults to ``DEFAULT_COMPRESSION``.
	compression_level?: #Gzip_CompressionLevel

	// A value used for selecting the zlib compression strategy which is directly related to the
	// characteristics of the content. Most of the time ``DEFAULT_STRATEGY`` will be the best choice,
	// though there are situations when changing this parameter might produce better results. For
	// example, run-length encoding (RLE) is typically used when the content is known for having
	// sequences in which the same data occurs many consecutive times. For more information about
	// each strategy, please refer to the `zlib manual <https://www.zlib.net/manual.html>`_.
	//
	// Defaults to ``DEFAULT_STRATEGY``.
	compression_strategy?: #Gzip_CompressionStrategy

	// Value from 9 to 15 that represents the base two logarithmic of the compressor's window size.
	// Larger window results in better compression at the expense of memory usage. For more details
	// about this parameter, please refer to the
	// `zlib manual <https://www.zlib.net/manual.html>`_ for ``deflateInit2``.
	//
	// Defaults to ``12``, which will produce a 4096 bytes window.
	window_bits?: uint32 & >=9 & <=15

	// Value for zlib's next output buffer. See the
	// `zlib manual <https://www.zlib.net/manual.html>`_ for more details. Also see
	// `envoy#8448 <https://github.com/envoyproxy/envoy/issues/8448>`_ for context on this filter's
	// performance.
	//
	// Defaults to ``4096``.
	chunk_size?: uint32 & >=4096 & <=65536
}

// All the values of this enumeration translate directly to zlib's compression strategies.
// For more information about each strategy, please refer to the
// `zlib manual <https://www.zlib.net/manual.html>`_.
#Gzip_CompressionStrategy:
	// Default compression strategy.
	"DEFAULT_STRATEGY" |

	// Filtered compression strategy, designed for data produced by a filter or predictor.
	"FILTERED" |

	// Huffman-only compression strategy, which uses Huffman encoding only.
	"HUFFMAN_ONLY" |

	// Run-length encoding (RLE) compression strategy, designed for image data.
	"RLE" |

	// Fixed compression strategy, which prevents the use of dynamic Huffman codes.
	"FIXED"

// Compression level values for zlib. Higher levels provide better compression at the cost of
// increased latency and CPU usage.
#Gzip_CompressionLevel:
	// Default compression level, equivalent to ``COMPRESSION_LEVEL_6``.
	"DEFAULT_COMPRESSION" |

	// Fastest compression with minimal compression ratio, equivalent to ``COMPRESSION_LEVEL_1``.
	"BEST_SPEED" |

	// Compression level 1 (fastest).
	"COMPRESSION_LEVEL_1" |

	// Compression level 2.
	"COMPRESSION_LEVEL_2" |

	// Compression level 3.
	"COMPRESSION_LEVEL_3" |

	// Compression level 4.
	"COMPRESSION_LEVEL_4" |

	// Compression level 5.
	"COMPRESSION_LEVEL_5" |

	// Compression level 6.
	"COMPRESSION_LEVEL_6" |

	// Compression level 7.
	"COMPRESSION_LEVEL_7" |

	// Compression level 8.
	"COMPRESSION_LEVEL_8" |

	// Compression level 9 (best compression).
	"COMPRESSION_LEVEL_9" |

	// Best compression ratio with highest latency, equivalent to ``COMPRESSION_LEVEL_9``.
	"BEST_COMPRESSION"
