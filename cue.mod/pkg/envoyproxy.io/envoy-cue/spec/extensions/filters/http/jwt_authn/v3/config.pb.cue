// Code generated from envoy/extensions/filters/http/jwt_authn/v3/config.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#JwtProvider: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtProvider"
	issuer?: string
	audiences?: [...string]
	subjects?:           v3_1.#StringMatcher
	require_expiration?: bool
	max_lifetime?:       string
	forward?:            bool
	from_headers?: [...#JwtHeader]
	from_params?: [...string]
	from_cookies?: [...string]
	forward_payload_header?:        string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	pad_forward_payload_header?:    bool
	payload_in_metadata?:           string
	normalize_payload_in_metadata?: #JwtProvider_NormalizePayload
	header_in_metadata?:            string
	failed_status_in_metadata?:     string
	clock_skew_seconds?:            uint32
	jwt_cache_config?:              #JwtCacheConfig
	claim_to_headers?: [...#JwtClaimToHeader]
	clear_route_cache?: bool

	// oneof jwks_source_specifier: exactly one must be set
	{remote_jwks!: #RemoteJwks} |
	{local_jwks!: v3_2.#DataSource}
}

#JwtProvider_NormalizePayload: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtProvider.NormalizePayload"
	space_delimited_claims?: [...string]
}

#JwtCacheConfig: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtCacheConfig"
	jwt_cache_size?:     uint32
	jwt_max_token_size?: uint32
}

#RemoteJwks: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.RemoteJwks"
	http_uri!:       v3_2.#HttpUri
	cache_duration?: string // TODO(pgv): duration bounds
	async_fetch?:    #JwksAsyncFetch
	retry_policy?:   v3_2.#RetryPolicy
}

#JwksAsyncFetch: {
	"@type":                  "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwksAsyncFetch"
	fast_listener?:           bool
	failed_refetch_duration?: string
}

#JwtHeader: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtHeader"
	name!:         string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	value_prefix?: string                       // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#ProviderWithAudiences: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.ProviderWithAudiences"
	provider_name?: string
	audiences?: [...string]
}

#JwtRequirement: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtRequirement"

	// oneof requires_type: at most one may be set
	*{} |
	{provider_name!: string} |
	{provider_and_audiences!: #ProviderWithAudiences} |
	{requires_any!: #JwtRequirementOrList} |
	{requires_all!: #JwtRequirementAndList} |
	{allow_missing_or_failed!: {}} |
	{allow_missing!: {}} |
	{extract_only_without_validation!: #ExtractOnlyWithoutValidation}
}

#ExtractOnlyWithoutValidation: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.ExtractOnlyWithoutValidation"
}

#JwtRequirementOrList: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtRequirementOrList"
	requirements!: [...#JwtRequirement] & list.MinItems(2)
}

#JwtRequirementAndList: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtRequirementAndList"
	requirements!: [...#JwtRequirement] & list.MinItems(2)
}

#RequirementRule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.RequirementRule"
	match!:  v3_3.#RouteMatch

	// oneof requirement_type: at most one may be set
	*{} |
	{requires!: #JwtRequirement} |
	{requirement_name!: string & strings.MinRunes(1)}
}

#FilterStateRule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.FilterStateRule"
	name!:   string & strings.MinRunes(1)
	requires?: {[string]: #JwtRequirement}
}

#JwtAuthentication: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtAuthentication"
	providers?: {[string]: #JwtProvider}
	rules?: [...#RequirementRule]
	filter_state_rules?:    #FilterStateRule
	bypass_cors_preflight?: bool
	requirement_map?: {[string]: #JwtRequirement}
	strip_failure_response?: bool
	stat_prefix?:            string
}

#PerRouteConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.PerRouteConfig"

	// oneof requirement_specifier: exactly one must be set
	{disabled!: bool & true} |
	{requirement_name!: string & strings.MinRunes(1)}
}

#JwtClaimToHeader: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.jwt_authn.v3.JwtClaimToHeader"
	header_name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	claim_name!:  string & strings.MinRunes(1)
}
