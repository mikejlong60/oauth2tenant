// Code generated from envoy/config/rbac/v2/rbac.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_4 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_3 "envoyproxy.io/envoy-cue/spec/type/matcher"
	route_2 "envoyproxy.io/envoy-cue/spec/api/v2/route"
	v1alpha1_1 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/api/expr/v1alpha1"
)

#RBAC: {
	"@type": "type.googleapis.com/envoy.config.rbac.v2.RBAC"
	action?: #RBAC_Action
	policies?: {[string]: #Policy}
}

#RBAC_Action: "ALLOW" | "DENY"

#Policy: {
	"@type": "type.googleapis.com/envoy.config.rbac.v2.Policy"
	permissions!: [...#Permission] & list.MinItems(1)
	principals!: [...#Principal] & list.MinItems(1)
	condition?: v1alpha1_1.#Expr
}

#Permission: {
	"@type": "type.googleapis.com/envoy.config.rbac.v2.Permission"

	// oneof rule: exactly one must be set
	{and_rules!: #Permission_Set} |
	{or_rules!: #Permission_Set} |
	{any!: bool & true} |
	{header!: route_2.#HeaderMatcher} |
	{url_path!: matcher_3.#PathMatcher} |
	{destination_ip!: core_4.#CidrRange} |
	{destination_port!: uint32 & <=65535} |
	{metadata!: matcher_3.#MetadataMatcher} |
	{not_rule!: #Permission} |
	{requested_server_name!: matcher_3.#StringMatcher}
}

#Permission_Set: {
	"@type": "type.googleapis.com/envoy.config.rbac.v2.Permission.Set"
	rules!: [...#Permission] & list.MinItems(1)
}

#Principal: {
	"@type": "type.googleapis.com/envoy.config.rbac.v2.Principal"

	// oneof identifier: exactly one must be set
	{and_ids!: #Principal_Set} |
	{or_ids!: #Principal_Set} |
	{any!: bool & true} |
	{authenticated!: #Principal_Authenticated} |
	{source_ip!: core_4.#CidrRange} |
	{direct_remote_ip!: core_4.#CidrRange} |
	{remote_ip!: core_4.#CidrRange} |
	{header!: route_2.#HeaderMatcher} |
	{url_path!: matcher_3.#PathMatcher} |
	{metadata!: matcher_3.#MetadataMatcher} |
	{not_id!: #Principal}
}

#Principal_Set: {
	"@type": "type.googleapis.com/envoy.config.rbac.v2.Principal.Set"
	ids!: [...#Principal] & list.MinItems(1)
}

#Principal_Authenticated: {
	"@type":         "type.googleapis.com/envoy.config.rbac.v2.Principal.Authenticated"
	principal_name?: matcher_3.#StringMatcher
}
