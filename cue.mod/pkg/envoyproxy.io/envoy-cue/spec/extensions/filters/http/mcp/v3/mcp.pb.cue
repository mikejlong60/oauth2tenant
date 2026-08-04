// Code generated from envoy/extensions/filters/http/mcp/v3/mcp.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// This filter will inspect and get attributes from MCP traffic.
// [#next-free-field: 6]
#Mcp: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.Mcp"

	// Configures how the filter handles non-MCP traffic.
	traffic_mode?: #Mcp_TrafficMode

	// When set to true, the filter will clear the route cache after setting dynamic metadata.
	// This allows the route to be re-selected based on the MCP metadata (e.g., method, params).
	// Defaults to false.
	clear_route_cache?: bool

	// Maximum size of the request body to buffer for JSON-RPC validation.
	// If the request body exceeds this size, the request is rejected with ``413 Payload Too Large``.
	// This limit applies to both ``REJECT_NO_MCP`` and ``PASS_THROUGH`` modes to prevent unbounded buffering.
	//
	// It defaults to 8KB (8192 bytes) and the maximum allowed value is 10MB (10485760 bytes).
	//
	// Setting it to 0 would disable the limit. It is not recommended to do so in production.
	max_request_body_size?: uint32 & <=10485760

	// Parser configuration, this provide the attribute extraction override.
	parser_config?: #ParserConfig

	// Where to store parsed MCP request attributes.
	// Controls whether attributes are written to dynamic metadata, filter state, or both.
	// Default is DYNAMIC_METADATA when unspecified.
	request_storage_mode?: #Mcp_RequestStorageMode
}

// Traffic handling mode for non-MCP traffic.
#Mcp_TrafficMode:
	// Proxies the HTTP request and response without MCP spec check.
	// This is the default mode.
	"PASS_THROUGH" |

	// Reject requests that are not following MCP spec.
	// Valid MCP requests are:
	// - POST requests with JSON-RPC 2.0 messages
	// - GET requests for SSE streams (with Accept: text/event-stream)
	"REJECT_NO_MCP"

// Where to store parsed MCP request attributes.
#Mcp_RequestStorageMode:
	// Unspecified. Uses default behavior (same as DYNAMIC_METADATA).
	"MODE_UNSPECIFIED" |

	// Store request attributes in dynamic metadata only.
	// This is the default behavior.
	"DYNAMIC_METADATA" |

	// Store request attributes in filter state only.
	"FILTER_STATE" |

	// Store request attributes in both dynamic metadata and filter state.
	"DYNAMIC_METADATA_AND_FILTER_STATE"

// Parser configuration with method-specific rules.
// This configuration allows overriding the default attribute extraction behavior for specific MCP methods.
#ParserConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.ParserConfig"

	// List of rules for classification and extraction.
	// Rules are evaluated in order; the first match wins.
	// If no rule matches, extraction defaults are used and group falls back to built-in classification.
	// Built-in groups: lifecycle, tool, resource, prompt, notification, logging, sampling, completion, unknown.
	methods?: [...#ParserConfig_MethodConfig]

	// The dynamic metadata key where the group name will be stored.
	// If empty, group classification is disabled.
	group_metadata_key?: string
}

// A single attribute extraction rule.
#ParserConfig_AttributeExtractionRule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.ParserConfig.AttributeExtractionRule"

	// JSON path to extract (e.g., "params.name", "params.uri").
	// The path is a dot-separated string representing the location of the field in the JSON payload.
	// For example, "params.name" extracts the "name" field from the "params" object.
	path!: string & strings.MinRunes(1)
}

// Configuration for a specific MCP method.
#ParserConfig_MethodConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.ParserConfig.MethodConfig"

	// Method name (e.g., "tools/call", "resources/read", "initialize").
	// This matches the "method" field in the JSON-RPC request.
	method!: string & strings.MinRunes(1)

	// The group/category name to assign to this method (e.g., "tool", "lifecycle").
	// This will be emitted to dynamic metadata under the key specified by group_metadata_key.
	// If empty, the built-in group classification is used.
	group?: string

	// Attributes to extract for this method.
	// If empty, only default attributes (jsonrpc, method) are extracted.
	extraction_rules?: [...#ParserConfig_AttributeExtractionRule]
}

// Per-route override configuration for MCP filter
#McpOverride: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.McpOverride"

	// Optional per-route traffic mode override
	traffic_mode?: #Mcp_TrafficMode

	// Optional per-route max request body size override.
	// When set, this overrides the global max_request_body_size for this route.
	// It defaults to 8KB (8192 bytes) and the maximum allowed value is 10MB (10485760 bytes).
	max_request_body_size?: uint32 & <=10485760
}
