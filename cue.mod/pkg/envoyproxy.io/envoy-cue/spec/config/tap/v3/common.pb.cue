// Code generated from envoy/config/tap/v3/common.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/common/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#TapConfig: {
	"@type":        "type.googleapis.com/envoy.config.tap.v3.TapConfig"
	match_config?:  #MatchPredicate
	match?:         v3_1.#MatchPredicate
	output_config!: #OutputConfig
	tap_enabled?:   v3_2.#RuntimeFractionalPercent
}

#MatchPredicate: {
	"@type": "type.googleapis.com/envoy.config.tap.v3.MatchPredicate"

	// oneof rule: exactly one must be set
	{or_match!: #MatchPredicate_MatchSet} |
	{and_match!: #MatchPredicate_MatchSet} |
	{not_match!: #MatchPredicate} |
	{any_match!: bool & true} |
	{http_request_headers_match!: #HttpHeadersMatch} |
	{http_request_trailers_match!: #HttpHeadersMatch} |
	{http_response_headers_match!: #HttpHeadersMatch} |
	{http_response_trailers_match!: #HttpHeadersMatch} |
	{http_request_generic_body_match!: #HttpGenericBodyMatch} |
	{http_response_generic_body_match!: #HttpGenericBodyMatch}
}

#MatchPredicate_MatchSet: {
	"@type": "type.googleapis.com/envoy.config.tap.v3.MatchPredicate.MatchSet"
	rules!: [...#MatchPredicate] & list.MinItems(2)
}

#HttpHeadersMatch: {
	"@type": "type.googleapis.com/envoy.config.tap.v3.HttpHeadersMatch"
	headers?: [...v3_3.#HeaderMatcher]
}

#HttpGenericBodyMatch: {
	"@type":      "type.googleapis.com/envoy.config.tap.v3.HttpGenericBodyMatch"
	bytes_limit?: uint32
	patterns!: [...#HttpGenericBodyMatch_GenericTextMatch] & list.MinItems(1)
}

#HttpGenericBodyMatch_GenericTextMatch: {
	"@type": "type.googleapis.com/envoy.config.tap.v3.HttpGenericBodyMatch.GenericTextMatch"

	// oneof rule: exactly one must be set
	{string_match!: string & strings.MinRunes(1)} |
	{binary_match!: bytes}
}

#OutputConfig: {
	"@type": "type.googleapis.com/envoy.config.tap.v3.OutputConfig"
	sinks!: [...#OutputSink] & list.MinItems(1) & list.MaxItems(1)
	max_buffered_rx_bytes?:   uint32
	max_buffered_tx_bytes?:   uint32
	streaming?:               bool
	min_streamed_sent_bytes?: uint32
}

#OutputSink: {
	"@type": "type.googleapis.com/envoy.config.tap.v3.OutputSink"
	format?: #OutputSink_Format

	// oneof output_sink_type: exactly one must be set
	{streaming_admin!: #StreamingAdminSink} |
	{file_per_tap!: #FilePerTapSink} |
	{streaming_grpc!: #StreamingGrpcSink} |
	{buffered_admin!: #BufferedAdminSink} |
	{custom_sink!: v3_2.#TypedExtensionConfig}
}

#OutputSink_Format: "JSON_BODY_AS_BYTES" | "JSON_BODY_AS_STRING" | "PROTO_BINARY" | "PROTO_BINARY_LENGTH_DELIMITED" | "PROTO_TEXT"

#StreamingAdminSink: {
	"@type": "type.googleapis.com/envoy.config.tap.v3.StreamingAdminSink"
}

#BufferedAdminSink: {
	"@type":     "type.googleapis.com/envoy.config.tap.v3.BufferedAdminSink"
	max_traces?: uint64 & >0
	timeout?:    string
}

#FilePerTapSink: {
	"@type":      "type.googleapis.com/envoy.config.tap.v3.FilePerTapSink"
	path_prefix!: string & strings.MinRunes(1)
}

#StreamingGrpcSink: {
	"@type":       "type.googleapis.com/envoy.config.tap.v3.StreamingGrpcSink"
	tap_id?:       string
	grpc_service!: v3_2.#GrpcService
}
