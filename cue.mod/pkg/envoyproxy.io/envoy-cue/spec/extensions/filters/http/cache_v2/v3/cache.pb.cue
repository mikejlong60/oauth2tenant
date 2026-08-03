// Code generated from envoy/extensions/filters/http/cache_v2/v3/cache.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#CacheV2Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.cache_v2.v3.CacheV2Config"
	typed_config?: {...}
	disabled?: bool
	allowed_vary_headers?: [...v3_1.#StringMatcher]
	key_creator_params?:                  #CacheV2Config_KeyCreatorParams
	max_body_bytes?:                      uint32
	ignore_request_cache_control_header?: bool
	override_upstream_cluster?:           string
}

#CacheV2Config_KeyCreatorParams: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.cache_v2.v3.CacheV2Config.KeyCreatorParams"
	exclude_scheme?: bool
	exclude_host?:   bool
	query_parameters_included?: [...v3_2.#QueryParameterMatcher]
	query_parameters_excluded?: [...v3_2.#QueryParameterMatcher]
}
