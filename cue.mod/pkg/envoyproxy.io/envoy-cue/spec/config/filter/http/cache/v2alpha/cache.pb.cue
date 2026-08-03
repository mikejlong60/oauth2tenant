// Code generated from envoy/config/filter/http/cache/v2alpha/cache.proto. DO NOT EDIT.
package v2alpha

import (
	matcher_1 "envoyproxy.io/envoy-cue/spec/type/matcher"
	route_2 "envoyproxy.io/envoy-cue/spec/api/v2/route"
)

#CacheConfig: {
	"@type": "type.googleapis.com/envoy.config.filter.http.cache.v2alpha.CacheConfig"
	typed_config?: {...}
	allowed_vary_headers?: [...matcher_1.#StringMatcher]
	key_creator_params?: #CacheConfig_KeyCreatorParams
	max_body_bytes?:     uint32
}

#CacheConfig_KeyCreatorParams: {
	"@type":         "type.googleapis.com/envoy.config.filter.http.cache.v2alpha.CacheConfig.KeyCreatorParams"
	exclude_scheme?: bool
	exclude_host?:   bool
	query_parameters_included?: [...route_2.#QueryParameterMatcher]
	query_parameters_excluded?: [...route_2.#QueryParameterMatcher]
}
