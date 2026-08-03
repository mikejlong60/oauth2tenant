// Code generated from envoy/extensions/filters/http/cors/v3/cors.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Cors: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.cors.v3.Cors"
}

#CorsPolicy: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.cors.v3.CorsPolicy"
	allow_origin_string_match?: [...v3_1.#StringMatcher]
	allow_methods?:                   string
	allow_headers?:                   string
	expose_headers?:                  string
	max_age?:                         string
	allow_credentials?:               bool
	filter_enabled?:                  v3_2.#RuntimeFractionalPercent
	shadow_enabled?:                  v3_2.#RuntimeFractionalPercent
	allow_private_network_access?:    bool
	forward_not_matching_preflights?: bool
}
