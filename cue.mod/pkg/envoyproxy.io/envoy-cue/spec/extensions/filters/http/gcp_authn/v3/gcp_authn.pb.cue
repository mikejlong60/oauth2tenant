// Code generated from envoy/extensions/filters/http/gcp_authn/v3/gcp_authn.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#GcpAuthnFilterConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.GcpAuthnFilterConfig"
	http_uri?:     v3_1.#HttpUri
	retry_policy?: v3_1.#RetryPolicy
	cache_config?: #TokenCacheConfig
	token_header?: #TokenHeader
	cluster?:      string
	timeout?:      string // TODO(pgv): duration bounds
}

#Audience: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.Audience"
	url!:    string & strings.MinRunes(1)
}

#TokenCacheConfig: {
	"@type":     "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.TokenCacheConfig"
	cache_size?: uint64 & <=9223372036854775807
}

#TokenHeader: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.TokenHeader"
	name!:         string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	value_prefix?: string                       // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}
