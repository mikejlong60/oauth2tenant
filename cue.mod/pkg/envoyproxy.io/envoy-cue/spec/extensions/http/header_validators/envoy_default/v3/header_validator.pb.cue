// Code generated from envoy/extensions/http/header_validators/envoy_default/v3/header_validator.proto. DO NOT EDIT.
package v3

#HeaderValidatorConfig: {
	"@type":                          "type.googleapis.com/envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig"
	http1_protocol_options?:          #HeaderValidatorConfig_Http1ProtocolOptions
	uri_path_normalization_options?:  #HeaderValidatorConfig_UriPathNormalizationOptions
	restrict_http_methods?:           bool
	headers_with_underscores_action?: #HeaderValidatorConfig_HeadersWithUnderscoresAction
	strip_fragment_from_path?:        bool
}

#HeaderValidatorConfig_UriPathNormalizationOptions: {
	"@type":                           "type.googleapis.com/envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig.UriPathNormalizationOptions"
	skip_path_normalization?:          bool
	skip_merging_slashes?:             bool
	path_with_escaped_slashes_action?: #HeaderValidatorConfig_UriPathNormalizationOptions_PathWithEscapedSlashesAction
}

#HeaderValidatorConfig_UriPathNormalizationOptions_PathWithEscapedSlashesAction: "IMPLEMENTATION_SPECIFIC_DEFAULT" | "KEEP_UNCHANGED" | "REJECT_REQUEST" | "UNESCAPE_AND_REDIRECT" | "UNESCAPE_AND_FORWARD"

#HeaderValidatorConfig_Http1ProtocolOptions: {
	"@type":               "type.googleapis.com/envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig.Http1ProtocolOptions"
	allow_chunked_length?: bool
}

#HeaderValidatorConfig_HeadersWithUnderscoresAction: "ALLOW" | "REJECT_REQUEST" | "DROP_HEADER"
