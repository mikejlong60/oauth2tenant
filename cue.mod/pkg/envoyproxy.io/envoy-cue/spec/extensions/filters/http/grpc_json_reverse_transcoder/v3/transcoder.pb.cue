// Code generated from envoy/extensions/filters/http/grpc_json_reverse_transcoder/v3/transcoder.proto. DO NOT EDIT.
package v3

#GrpcJsonReverseTranscoder: {
	"@type":                     "type.googleapis.com/envoy.extensions.filters.http.grpc_json_reverse_transcoder.v3.GrpcJsonReverseTranscoder"
	descriptor_path?:            string
	descriptor_binary?:          bytes
	max_request_body_size?:      uint32 & >0
	max_response_body_size?:     uint32 & >0
	api_version_header?:         string
	request_json_print_options?: #GrpcJsonReverseTranscoder_PrintOptions
}

#GrpcJsonReverseTranscoder_PrintOptions: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.http.grpc_json_reverse_transcoder.v3.GrpcJsonReverseTranscoder.PrintOptions"
	always_print_primitive_fields?: bool
	always_print_enums_as_ints?:    bool
	use_canonical_field_names?:     bool
}
