// Code generated from envoy/config/core/v3/substitution_format_string.proto. DO NOT EDIT.
package v3

#JsonFormatOptions: {
	"@type":          "type.googleapis.com/envoy.config.core.v3.JsonFormatOptions"
	sort_properties?: bool
}

#SubstitutionFormatString: {
	"@type":      "type.googleapis.com/envoy.config.core.v3.SubstitutionFormatString"
	text_format?: string
	json_format!: {...}
	text_format_source?: #DataSource
	omit_empty_values?:  bool
	content_type?:       string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	formatters?: [...#TypedExtensionConfig]
	json_format_options?: #JsonFormatOptions
}
