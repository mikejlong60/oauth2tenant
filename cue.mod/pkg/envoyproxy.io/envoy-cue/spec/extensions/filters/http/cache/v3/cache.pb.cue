// Code generated from envoy/extensions/filters/http/cache/v3/cache.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#CacheConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.cache.v3.CacheConfig"
	typed_config?: {...}
	disabled?: bool
	allowed_vary_headers?: [...v3_1.#StringMatcher]
	key_creator_params?:                  #CacheConfig_KeyCreatorParams
	max_body_bytes?:                      uint32
	ignore_request_cache_control_header?: bool
}

#CacheConfig_KeyCreatorParams: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.cache.v3.CacheConfig.KeyCreatorParams"
	exclude_scheme?: bool
	exclude_host?:   bool
	query_parameters_included?: [...v3_2.#QueryParameterMatcher]
	query_parameters_excluded?: [...v3_2.#QueryParameterMatcher]
}
