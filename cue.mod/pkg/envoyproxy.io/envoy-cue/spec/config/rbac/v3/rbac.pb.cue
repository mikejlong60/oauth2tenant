// Code generated from envoy/config/rbac/v3/rbac.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v1alpha1_2 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/api/expr/v1alpha1"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/route/v3"
	v3_5 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#RBAC: {
	"@type": "type.googleapis.com/envoy.config.rbac.v3.RBAC"
	action?: #RBAC_Action
	policies?: {[string]: #Policy}
	audit_logging_options?: #RBAC_AuditLoggingOptions
}

#RBAC_AuditLoggingOptions: {
	"@type":          "type.googleapis.com/envoy.config.rbac.v3.RBAC.AuditLoggingOptions"
	audit_condition?: #RBAC_AuditLoggingOptions_AuditCondition
	logger_configs?: [...#RBAC_AuditLoggingOptions_AuditLoggerConfig]
}

#RBAC_AuditLoggingOptions_AuditLoggerConfig: {
	"@type":       "type.googleapis.com/envoy.config.rbac.v3.RBAC.AuditLoggingOptions.AuditLoggerConfig"
	audit_logger?: v3_1.#TypedExtensionConfig
	is_optional?:  bool
}

#RBAC_AuditLoggingOptions_AuditCondition: "NONE" | "ON_DENY" | "ON_ALLOW" | "ON_DENY_AND_ALLOW"

#RBAC_Action: "ALLOW" | "DENY" | "LOG"

#Policy: {
	"@type": "type.googleapis.com/envoy.config.rbac.v3.Policy"
	permissions!: [...#Permission] & list.MinItems(1)
	principals!: [...#Principal] & list.MinItems(1)
	condition?:         v1alpha1_2.#Expr
	checked_condition?: v1alpha1_2.#CheckedExpr
	cel_config?:        v3_1.#CelExpressionConfig
}

#SourcedMetadata: {
	"@type":           "type.googleapis.com/envoy.config.rbac.v3.SourcedMetadata"
	metadata_matcher!: v3_3.#MetadataMatcher
	metadata_source?:  #MetadataSource
}

#Permission: {
	"@type":                 "type.googleapis.com/envoy.config.rbac.v3.Permission"
	and_rules?:              #Permission_Set
	or_rules?:               #Permission_Set
	any!:                    bool & true
	header?:                 v3_4.#HeaderMatcher
	url_path?:               v3_3.#PathMatcher
	destination_ip?:         v3_1.#CidrRange
	destination_port?:       uint32 & <=65535
	destination_port_range?: v3_5.#Int32Range
	metadata?:               v3_3.#MetadataMatcher
	not_rule?:               #Permission
	requested_server_name?:  v3_3.#StringMatcher
	matcher?:                v3_1.#TypedExtensionConfig
	uri_template?:           v3_1.#TypedExtensionConfig
	sourced_metadata?:       #SourcedMetadata
}

#Permission_Set: {
	"@type": "type.googleapis.com/envoy.config.rbac.v3.Permission.Set"
	rules!: [...#Permission] & list.MinItems(1)
}

#Principal: {
	"@type":           "type.googleapis.com/envoy.config.rbac.v3.Principal"
	and_ids?:          #Principal_Set
	or_ids?:           #Principal_Set
	any!:              bool & true
	authenticated?:    #Principal_Authenticated
	source_ip?:        v3_1.#CidrRange
	direct_remote_ip?: v3_1.#CidrRange
	remote_ip?:        v3_1.#CidrRange
	header?:           v3_4.#HeaderMatcher
	url_path?:         v3_3.#PathMatcher
	metadata?:         v3_3.#MetadataMatcher
	filter_state?:     v3_3.#FilterStateMatcher
	not_id?:           #Principal
	sourced_metadata?: #SourcedMetadata
	custom?:           v3_1.#TypedExtensionConfig
}

#Principal_Set: {
	"@type": "type.googleapis.com/envoy.config.rbac.v3.Principal.Set"
	ids!: [...#Principal] & list.MinItems(1)
}

#Principal_Authenticated: {
	"@type":         "type.googleapis.com/envoy.config.rbac.v3.Principal.Authenticated"
	principal_name?: v3_3.#StringMatcher
}

#Action: {
	"@type": "type.googleapis.com/envoy.config.rbac.v3.Action"
	name!:   string & strings.MinRunes(1)
	action?: #RBAC_Action
}

#MetadataSource: "DYNAMIC" | "ROUTE"
