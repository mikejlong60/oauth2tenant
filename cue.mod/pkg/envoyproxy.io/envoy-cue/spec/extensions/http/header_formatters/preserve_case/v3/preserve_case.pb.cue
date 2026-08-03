// Code generated from envoy/extensions/http/header_formatters/preserve_case/v3/preserve_case.proto. DO NOT EDIT.
package v3

#PreserveCaseFormatterConfig: {
	"@type":                          "type.googleapis.com/envoy.extensions.http.header_formatters.preserve_case.v3.PreserveCaseFormatterConfig"
	forward_reason_phrase?:           bool
	formatter_type_on_envoy_headers?: #PreserveCaseFormatterConfig_FormatterTypeOnEnvoyHeaders
}

#PreserveCaseFormatterConfig_FormatterTypeOnEnvoyHeaders: "DEFAULT" | "PROPER_CASE"
