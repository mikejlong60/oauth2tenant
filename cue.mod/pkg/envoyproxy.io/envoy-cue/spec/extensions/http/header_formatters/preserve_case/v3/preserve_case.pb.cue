// Code generated from envoy/extensions/http/header_formatters/preserve_case/v3/preserve_case.proto. DO NOT EDIT.
package v3

// Configuration for the preserve case header formatter.
// See the :ref:`header casing <config_http_conn_man_header_casing>` configuration guide for more
// information.
#PreserveCaseFormatterConfig: {
	"@type": "type.googleapis.com/envoy.extensions.http.header_formatters.preserve_case.v3.PreserveCaseFormatterConfig"

	// Allows forwarding reason phrase text.
	// This is off by default, and a standard reason phrase is used for a corresponding HTTP response code.
	forward_reason_phrase?: bool

	// Type of formatter to use on headers which are added by Envoy (which are lower case by default).
	// The default type is DEFAULT, use LowerCase on Envoy headers.
	formatter_type_on_envoy_headers?: #PreserveCaseFormatterConfig_FormatterTypeOnEnvoyHeaders
}

#PreserveCaseFormatterConfig_FormatterTypeOnEnvoyHeaders:
	// Use LowerCase on Envoy added headers.
	"DEFAULT" |

	// Use ProperCaseHeaderKeyFormatter on Envoy added headers that upper cases the first character
	// in each word. The first character as well as any alpha character following a special
	// character is upper cased.
	"PROPER_CASE"
