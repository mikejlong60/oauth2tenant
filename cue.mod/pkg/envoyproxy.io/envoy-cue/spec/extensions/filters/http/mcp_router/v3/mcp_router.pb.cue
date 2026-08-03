// Code generated from envoy/extensions/filters/http/mcp_router/v3/mcp_router.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

#HeaderSource: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.HeaderSource"
	name!:   string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#DynamicMetadataSource: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.DynamicMetadataSource"
	key!:    v3_1.#MetadataKey
}

#IdentityExtractor: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.IdentityExtractor"
	header?:           #HeaderSource
	dynamic_metadata?: #DynamicMetadataSource
}

#ValidationPolicy: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.ValidationPolicy"
	mode?:   #ValidationPolicy_Mode
}

#ValidationPolicy_Mode: "MODE_UNSPECIFIED" | "DISABLED" | "ENFORCE"

#SessionIdentity: {
	"@type":     "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.SessionIdentity"
	identity!:   #IdentityExtractor
	validation?: #ValidationPolicy
}

#McpRouter: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.McpRouter"
	servers?: [...#McpRouter_McpBackend]
	session_identity?: #SessionIdentity
}

#McpRouter_McpBackend: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.McpRouter.McpBackend"
	name?:        string
	mcp_cluster?: #McpRouter_McpCluster
}

#McpRouter_McpCluster: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.McpRouter.McpCluster"
	cluster!:              string & strings.MinRunes(1)
	path?:                 string
	timeout?:              string
	host_rewrite_literal?: string
}
