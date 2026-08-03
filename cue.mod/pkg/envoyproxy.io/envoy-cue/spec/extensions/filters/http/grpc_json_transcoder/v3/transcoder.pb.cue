// Code generated from envoy/extensions/filters/http/grpc_json_transcoder/v3/transcoder.proto. DO NOT EDIT.
package v3

#GrpcJsonTranscoder: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.grpc_json_transcoder.v3.GrpcJsonTranscoder"
	proto_descriptor?:     string
	proto_descriptor_bin?: bytes
	services?: [...string]
	print_options?:                #GrpcJsonTranscoder_PrintOptions
	match_incoming_request_route?: bool
	ignored_query_parameters?: [...string]
	auto_mapping?:                     bool
	ignore_unknown_query_parameters?:  bool
	convert_grpc_status?:              bool
	url_unescape_spec?:                #GrpcJsonTranscoder_UrlUnescapeSpec
	query_param_unescape_plus?:        bool
	match_unregistered_custom_verb?:   bool
	request_validation_options?:       #GrpcJsonTranscoder_RequestValidationOptions
	case_insensitive_enum_parsing?:    bool
	max_request_body_size?:            uint32 & >0
	max_response_body_size?:           uint32 & >0
	capture_unknown_query_parameters?: bool
}

#GrpcJsonTranscoder_PrintOptions: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.http.grpc_json_transcoder.v3.GrpcJsonTranscoder.PrintOptions"
	add_whitespace?:                bool
	always_print_primitive_fields?: bool
	always_print_enums_as_ints?:    bool
	preserve_proto_field_names?:    bool
	stream_newline_delimited?:      bool
	stream_sse_style_delimited?:    bool
}

#GrpcJsonTranscoder_RequestValidationOptions: {
	"@type":                               "type.googleapis.com/envoy.extensions.filters.http.grpc_json_transcoder.v3.GrpcJsonTranscoder.RequestValidationOptions"
	reject_unknown_method?:                bool
	reject_unknown_query_parameters?:      bool
	reject_binding_body_field_collisions?: bool
}

#GrpcJsonTranscoder_UrlUnescapeSpec: "ALL_CHARACTERS_EXCEPT_RESERVED" | "ALL_CHARACTERS_EXCEPT_SLASH" | "ALL_CHARACTERS"

#UnknownQueryParams: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.grpc_json_transcoder.v3.UnknownQueryParams"
	key?: {[string]: #UnknownQueryParams_Values}
}

#UnknownQueryParams_Values: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.grpc_json_transcoder.v3.UnknownQueryParams.Values"
	values?: [...string]
}
