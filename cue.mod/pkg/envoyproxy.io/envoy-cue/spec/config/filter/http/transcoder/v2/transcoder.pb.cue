// Code generated from envoy/config/filter/http/transcoder/v2/transcoder.proto. DO NOT EDIT.
package v2

import (
	"list"
)

#GrpcJsonTranscoder: {
	"@type": "type.googleapis.com/envoy.config.filter.http.transcoder.v2.GrpcJsonTranscoder"
	services!: [...string] & list.MinItems(1)
	print_options?:                #GrpcJsonTranscoder_PrintOptions
	match_incoming_request_route?: bool
	ignored_query_parameters?: [...string]
	auto_mapping?:                    bool
	ignore_unknown_query_parameters?: bool
	convert_grpc_status?:             bool

	// oneof descriptor_set: exactly one must be set
	{proto_descriptor!: string} |
	{proto_descriptor_bin!: bytes}
}

#GrpcJsonTranscoder_PrintOptions: {
	"@type":                        "type.googleapis.com/envoy.config.filter.http.transcoder.v2.GrpcJsonTranscoder.PrintOptions"
	add_whitespace?:                bool
	always_print_primitive_fields?: bool
	always_print_enums_as_ints?:    bool
	preserve_proto_field_names?:    bool
}
