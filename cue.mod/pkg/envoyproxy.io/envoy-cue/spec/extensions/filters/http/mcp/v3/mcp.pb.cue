// Code generated from envoy/extensions/filters/http/mcp/v3/mcp.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Mcp: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.Mcp"
	traffic_mode?:          #Mcp_TrafficMode
	clear_route_cache?:     bool
	max_request_body_size?: uint32 & <=10485760
	parser_config?:         #ParserConfig
	request_storage_mode?:  #Mcp_RequestStorageMode
}

#Mcp_TrafficMode: "PASS_THROUGH" | "REJECT_NO_MCP"

#Mcp_RequestStorageMode: "MODE_UNSPECIFIED" | "DYNAMIC_METADATA" | "FILTER_STATE" | "DYNAMIC_METADATA_AND_FILTER_STATE"

#ParserConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.ParserConfig"
	methods?: [...#ParserConfig_MethodConfig]
	group_metadata_key?: string
}

#ParserConfig_AttributeExtractionRule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.ParserConfig.AttributeExtractionRule"
	path!:   string & strings.MinRunes(1)
}

#ParserConfig_MethodConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.ParserConfig.MethodConfig"
	method!: string & strings.MinRunes(1)
	group?:  string
	extraction_rules?: [...#ParserConfig_AttributeExtractionRule]
}

#McpOverride: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.http.mcp.v3.McpOverride"
	traffic_mode?:          #Mcp_TrafficMode
	max_request_body_size?: uint32 & <=10485760
}
