// Code generated from envoy/extensions/filters/http/file_system_buffer/v3/file_system_buffer.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/async_files/v3"
)

#BufferBehavior: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.BufferBehavior"

	// oneof behavior: exactly one must be set
	{stream_when_possible!: #BufferBehavior_StreamWhenPossible} |
	{bypass!: #BufferBehavior_Bypass} |
	{inject_content_length_if_necessary!: #BufferBehavior_InjectContentLengthIfNecessary} |
	{fully_buffer_and_always_inject_content_length!: #BufferBehavior_FullyBufferAndAlwaysInjectContentLength} |
	{fully_buffer!: #BufferBehavior_FullyBuffer}
}

#BufferBehavior_StreamWhenPossible: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.BufferBehavior.StreamWhenPossible"
}

#BufferBehavior_Bypass: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.BufferBehavior.Bypass"
}

#BufferBehavior_InjectContentLengthIfNecessary: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.BufferBehavior.InjectContentLengthIfNecessary"
}

#BufferBehavior_FullyBufferAndAlwaysInjectContentLength: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.BufferBehavior.FullyBufferAndAlwaysInjectContentLength"
}

#BufferBehavior_FullyBuffer: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.BufferBehavior.FullyBuffer"
}

#StreamConfig: {
	"@type":                                    "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.StreamConfig"
	behavior?:                                  #BufferBehavior
	memory_buffer_bytes_limit?:                 uint64 & >0
	storage_buffer_bytes_limit?:                uint64
	storage_buffer_queue_high_watermark_bytes?: uint64
}

#FileSystemBufferFilterConfig: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.http.file_system_buffer.v3.FileSystemBufferFilterConfig"
	manager_config?:      v3_1.#AsyncFileManagerConfig
	storage_buffer_path?: string
	request?:             #StreamConfig
	response?:            #StreamConfig
}
