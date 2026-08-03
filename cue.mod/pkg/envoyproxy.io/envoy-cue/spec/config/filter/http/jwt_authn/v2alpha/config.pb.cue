// Code generated from envoy/config/filter/http/jwt_authn/v2alpha/config.proto. DO NOT EDIT.
package v2alpha

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	route_2 "envoyproxy.io/envoy-cue/spec/api/v2/route"
)

#JwtProvider: {
	"@type": "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.JwtProvider"
	issuer!: string & !=""
	audiences?: [...string]
	remote_jwks?: #RemoteJwks
	local_jwks?:  core_1.#DataSource
	forward?:     bool
	from_headers?: [...#JwtHeader]
	from_params?: [...string]
	forward_payload_header?: string
	payload_in_metadata?:    string
}

#RemoteJwks: {
	"@type":         "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.RemoteJwks"
	http_uri?:       core_1.#HttpUri
	cache_duration?: string
}

#JwtHeader: {
	"@type":       "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.JwtHeader"
	name!:         string & !=""
	value_prefix?: string
}

#ProviderWithAudiences: {
	"@type":        "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.ProviderWithAudiences"
	provider_name?: string
	audiences?: [...string]
}

#JwtRequirement: {
	"@type":                 "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.JwtRequirement"
	provider_name?:          string
	provider_and_audiences?: #ProviderWithAudiences
	requires_any?:           #JwtRequirementOrList
	requires_all?:           #JwtRequirementAndList
	allow_missing_or_failed?: {}
	allow_missing?: {}
}

#JwtRequirementOrList: {
	"@type": "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.JwtRequirementOrList"
	requirements!: [...#JwtRequirement] & list.MinItems(2)
}

#JwtRequirementAndList: {
	"@type": "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.JwtRequirementAndList"
	requirements!: [...#JwtRequirement] & list.MinItems(2)
}

#RequirementRule: {
	"@type":   "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.RequirementRule"
	match!:    route_2.#RouteMatch
	requires?: #JwtRequirement
}

#FilterStateRule: {
	"@type": "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.FilterStateRule"
	name!:   string & !=""
	requires?: {[string]: #JwtRequirement}
}

#JwtAuthentication: {
	"@type": "type.googleapis.com/envoy.config.filter.http.jwt_authn.v2alpha.JwtAuthentication"
	providers?: {[string]: #JwtProvider}
	rules?: [...#RequirementRule]
	filter_state_rules?:    #FilterStateRule
	bypass_cors_preflight?: bool
}
