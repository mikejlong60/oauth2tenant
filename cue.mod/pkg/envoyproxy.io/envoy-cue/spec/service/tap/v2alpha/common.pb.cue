// Code generated from envoy/service/tap/v2alpha/common.proto. DO NOT EDIT.
package v2alpha

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	route_2 "envoyproxy.io/envoy-cue/spec/api/v2/route"
)

#TapConfig: {
	"@type":        "type.googleapis.com/envoy.service.tap.v2alpha.TapConfig"
	match_config!:  #MatchPredicate
	output_config!: #OutputConfig
	tap_enabled?:   core_1.#RuntimeFractionalPercent
}

#MatchPredicate: {
	"@type":                       "type.googleapis.com/envoy.service.tap.v2alpha.MatchPredicate"
	or_match?:                     #MatchPredicate_MatchSet
	and_match?:                    #MatchPredicate_MatchSet
	not_match?:                    #MatchPredicate
	any_match!:                    bool & true
	http_request_headers_match?:   #HttpHeadersMatch
	http_request_trailers_match?:  #HttpHeadersMatch
	http_response_headers_match?:  #HttpHeadersMatch
	http_response_trailers_match?: #HttpHeadersMatch
}

#MatchPredicate_MatchSet: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.MatchPredicate.MatchSet"
	rules!: [...#MatchPredicate] & list.MinItems(2)
}

#HttpHeadersMatch: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.HttpHeadersMatch"
	headers?: [...route_2.#HeaderMatcher]
}

#OutputConfig: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.OutputConfig"
	sinks!: [...#OutputSink] & list.MinItems(1) & list.MaxItems(1)
	max_buffered_rx_bytes?: uint32
	max_buffered_tx_bytes?: uint32
	streaming?:             bool
}

#OutputSink: {
	"@type":          "type.googleapis.com/envoy.service.tap.v2alpha.OutputSink"
	format?:          #OutputSink_Format
	streaming_admin?: #StreamingAdminSink
	file_per_tap?:    #FilePerTapSink
	streaming_grpc?:  #StreamingGrpcSink
}

#OutputSink_Format: "JSON_BODY_AS_BYTES" | "JSON_BODY_AS_STRING" | "PROTO_BINARY" | "PROTO_BINARY_LENGTH_DELIMITED" | "PROTO_TEXT"

#StreamingAdminSink: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.StreamingAdminSink"
}

#FilePerTapSink: {
	"@type":      "type.googleapis.com/envoy.service.tap.v2alpha.FilePerTapSink"
	path_prefix!: string & !=""
}

#StreamingGrpcSink: {
	"@type":       "type.googleapis.com/envoy.service.tap.v2alpha.StreamingGrpcSink"
	tap_id?:       string
	grpc_service!: core_1.#GrpcService
}
