// Code generated from envoy/extensions/filters/http/mcp_router/v3/mcp_router.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

// Extract identity from a request header.
#HeaderSource: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.HeaderSource"

	// Header name to extract (e.g., "x-user-identity").
	name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

// Extract identity from dynamic metadata (e.g., populated by JWT or ext_authz filter).
#DynamicMetadataSource: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.DynamicMetadataSource"

	// The metadata key to retrieve the value from.
	key!: v3_1.#MetadataKey
}

// Defines how the identity (user/principal) is extracted from the request.
// Exactly one of ``header`` or ``dynamic_metadata`` must be set.
#IdentityExtractor: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.IdentityExtractor"

	// Extract identity from a request header.
	header?: #HeaderSource

	// Extract identity from dynamic metadata.
	dynamic_metadata?: #DynamicMetadataSource
}

// Specifies how to handle requests where the identity is missing or mismatched.
#ValidationPolicy: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.ValidationPolicy"
	mode?:   #ValidationPolicy_Mode
}

#ValidationPolicy_Mode:
	// Not specified. Defaults to DISABLED behavior.
	"MODE_UNSPECIFIED" |

	// Bind identity on Initialize if present, but do not validate subsequent requests.
	// If extraction fails, the session proceeds anonymously.
	"DISABLED" |

	// Reject the request (403) if the identity cannot be extracted
	// or if the session identity does not match the request identity.
	"ENFORCE"

// Session identity configuration.
#SessionIdentity: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.SessionIdentity"

	// Defines how the identity (user/principal) is extracted from the request.
	identity!: #IdentityExtractor

	// Specifies how to handle requests where the subject is missing or invalid.
	// Defaults to DISABLED.
	validation?: #ValidationPolicy
}

#McpRouter: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.McpRouter"

	// A list of remote MCP servers. MCP router aggregates capabilities, tools and resources from remote MCP servers
	// and presents itself as single MCP server to the client. All remote MCP servers are sent the same capabilities
	// that the client presented to Envoy.
	servers?: [...#McpRouter_McpBackend]

	// If set, extracts a request "subject" and binds it into the MCP session.
	// If not set, sessions are created without identity binding.
	session_identity?: #SessionIdentity
}

// Specification of the MCP server.
#McpRouter_McpBackend: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.McpRouter.McpBackend"

	// Unique name for this backend. Used for:
	// - Tool name prefixing (e.g., "time__get_current_time")
	// - Session ID composition
	// - Logging and error messages.
	// Default will be the cluster name if not specified.
	name?: string

	// Backend target specification.
	mcp_cluster?: #McpRouter_McpCluster
}

// Cluster-based backend configuration.
#McpRouter_McpCluster: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp_router.v3.McpRouter.McpCluster"

	// Cluster name to route requests to.
	cluster!: string & strings.MinRunes(1)

	// Path to use for MCP requests. Defaults to "/mcp".
	path?: string

	// Request timeout.
	// If not set, uses cluster's timeout configuration.
	timeout?: string

	// Indicates that during forwarding, the host header will be swapped with
	// this value.
	host_rewrite_literal?: string
}
