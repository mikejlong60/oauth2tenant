// Code generated from envoy/extensions/http/cache_v2/file_system_http_cache/v3/file_system_http_cache.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/common/async_files/v3"
)

#FileSystemHttpCacheV2Config: {
	"@type":                                "type.googleapis.com/envoy.extensions.http.cache_v2.file_system_http_cache.v3.FileSystemHttpCacheV2Config"
	manager_config!:                        v3_1.#AsyncFileManagerConfig
	cache_path!:                            string & strings.MinRunes(1)
	max_cache_size_bytes?:                  uint64
	max_individual_cache_entry_size_bytes?: uint64
	max_cache_entry_count?:                 uint64
	cache_subdivisions?:                    uint32
	evict_fraction?:                        float32
	max_eviction_period?:                   string
	min_eviction_period?:                   string
	create_cache_path?:                     bool
}
