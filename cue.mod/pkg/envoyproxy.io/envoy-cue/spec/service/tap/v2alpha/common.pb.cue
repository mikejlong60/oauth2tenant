// Code generated from envoy/service/tap/v2alpha/common.proto. DO NOT EDIT.
package v2alpha

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	route_2 "envoyproxy.io/envoy-cue/spec/api/v2/route"
)

// Tap configuration.
#TapConfig: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.TapConfig"

	// The match configuration. If the configuration matches the data source being tapped, a tap will
	// occur, with the result written to the configured output.
	match_config!: #MatchPredicate

	// The tap output configuration. If a match configuration matches a data source being tapped,
	// a tap will occur and the data will be written to the configured output.
	output_config!: #OutputConfig

	// [#not-implemented-hide:] Specify if Tap matching is enabled. The % of requests\connections for
	// which the tap matching is enabled. When not enabled, the request\connection will not be
	// recorded.
	//
	// .. note::
	//
	//   This field defaults to 100/:ref:`HUNDRED
	//   <envoy_api_enum_type.FractionalPercent.DenominatorType>`.
	tap_enabled?: core_1.#RuntimeFractionalPercent
}

// Tap match configuration. This is a recursive structure which allows complex nested match
// configurations to be built using various logical operators.
// [#next-free-field: 9]
#MatchPredicate: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.MatchPredicate"

	// oneof rule: exactly one must be set
	// A set that describes a logical OR. If any member of the set matches, the match configuration
	// matches.
	{or_match!: #MatchPredicate_MatchSet} |
	{

		// A set that describes a logical AND. If all members of the set match, the match configuration
		// matches.
		and_match!: #MatchPredicate_MatchSet
	} |
	{

		// A negation match. The match configuration will match if the negated match condition matches.
		not_match!: #MatchPredicate
	} |
	{

		// The match configuration will always match.
		any_match!: bool & true
	} |
	{

		// HTTP request headers match configuration.
		http_request_headers_match!: #HttpHeadersMatch
	} |
	{

		// HTTP request trailers match configuration.
		http_request_trailers_match!: #HttpHeadersMatch
	} |
	{

		// HTTP response headers match configuration.
		http_response_headers_match!: #HttpHeadersMatch
	} |
	{

		// HTTP response trailers match configuration.
		http_response_trailers_match!: #HttpHeadersMatch
	}
}

// A set of match configurations used for logical operations.
#MatchPredicate_MatchSet: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.MatchPredicate.MatchSet"

	// The list of rules that make up the set.
	rules!: [...#MatchPredicate] & list.MinItems(2)
}

// HTTP headers match configuration.
#HttpHeadersMatch: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.HttpHeadersMatch"

	// HTTP headers to match.
	headers?: [...route_2.#HeaderMatcher]
}

// Tap output configuration.
#OutputConfig: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.OutputConfig"

	// Output sinks for tap data. Currently a single sink is allowed in the list. Once multiple
	// sink types are supported this constraint will be relaxed.
	sinks!: [...#OutputSink] & list.MinItems(1) & list.MaxItems(1)

	// For buffered tapping, the maximum amount of received body that will be buffered prior to
	// truncation. If truncation occurs, the :ref:`truncated
	// <envoy_api_field_data.tap.v2alpha.Body.truncated>` field will be set. If not specified, the
	// default is 1KiB.
	max_buffered_rx_bytes?: uint32

	// For buffered tapping, the maximum amount of transmitted body that will be buffered prior to
	// truncation. If truncation occurs, the :ref:`truncated
	// <envoy_api_field_data.tap.v2alpha.Body.truncated>` field will be set. If not specified, the
	// default is 1KiB.
	max_buffered_tx_bytes?: uint32

	// Indicates whether taps produce a single buffered message per tap, or multiple streamed
	// messages per tap in the emitted :ref:`TraceWrapper
	// <envoy_api_msg_data.tap.v2alpha.TraceWrapper>` messages. Note that streamed tapping does not
	// mean that no buffering takes place. Buffering may be required if data is processed before a
	// match can be determined. See the HTTP tap filter :ref:`streaming
	// <config_http_filters_tap_streaming>` documentation for more information.
	streaming?: bool
}

// Tap output sink configuration.
#OutputSink: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.OutputSink"

	// Sink output format.
	format?: #OutputSink_Format

	// oneof output_sink_type: exactly one must be set
	// Tap output will be streamed out the :http:post:`/tap` admin endpoint.
	//
	// .. attention::
	//
	//   It is only allowed to specify the streaming admin output sink if the tap is being
	//   configured from the :http:post:`/tap` admin endpoint. Thus, if an extension has
	//   been configured to receive tap configuration from some other source (e.g., static
	//   file, XDS, etc.) configuring the streaming admin output type will fail.
	{streaming_admin!: #StreamingAdminSink} |
	{

		// Tap output will be written to a file per tap sink.
		file_per_tap!: #FilePerTapSink
	} |
	{

		// [#not-implemented-hide:]
		// GrpcService to stream data to. The format argument must be PROTO_BINARY.
		streaming_grpc!: #StreamingGrpcSink
	}
}

// Output format. All output is in the form of one or more :ref:`TraceWrapper
// <envoy_api_msg_data.tap.v2alpha.TraceWrapper>` messages. This enumeration indicates
// how those messages are written. Note that not all sinks support all output formats. See
// individual sink documentation for more information.
#OutputSink_Format:
	// Each message will be written as JSON. Any :ref:`body <envoy_api_msg_data.tap.v2alpha.Body>`
	// data will be present in the :ref:`as_bytes
	// <envoy_api_field_data.tap.v2alpha.Body.as_bytes>` field. This means that body data will be
	// base64 encoded as per the `proto3 JSON mappings
	// <https://developers.google.com/protocol-buffers/docs/proto3#json>`_.
	"JSON_BODY_AS_BYTES" |

	// Each message will be written as JSON. Any :ref:`body <envoy_api_msg_data.tap.v2alpha.Body>`
	// data will be present in the :ref:`as_string
	// <envoy_api_field_data.tap.v2alpha.Body.as_string>` field. This means that body data will be
	// string encoded as per the `proto3 JSON mappings
	// <https://developers.google.com/protocol-buffers/docs/proto3#json>`_. This format type is
	// useful when it is known that that body is human readable (e.g., JSON over HTTP) and the
	// user wishes to view it directly without being forced to base64 decode the body.
	"JSON_BODY_AS_STRING" |

	// Binary proto format. Note that binary proto is not self-delimiting. If a sink writes
	// multiple binary messages without any length information the data stream will not be
	// useful. However, for certain sinks that are self-delimiting (e.g., one message per file)
	// this output format makes consumption simpler.
	"PROTO_BINARY" |

	// Messages are written as a sequence tuples, where each tuple is the message length encoded
	// as a `protobuf 32-bit varint
	// <https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.io.coded_stream>`_
	// followed by the binary message. The messages can be read back using the language specific
	// protobuf coded stream implementation to obtain the message length and the message.
	"PROTO_BINARY_LENGTH_DELIMITED" |

	// Text proto format.
	"PROTO_TEXT"

// Streaming admin sink configuration.
#StreamingAdminSink: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.StreamingAdminSink"
}

// The file per tap sink outputs a discrete file for every tapped stream.
#FilePerTapSink: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.FilePerTapSink"

	// Path prefix. The output file will be of the form <path_prefix>_<id>.pb, where <id> is an
	// identifier distinguishing the recorded trace for stream instances (the Envoy
	// connection ID, HTTP stream ID, etc.).
	path_prefix!: string & !=""
}

// [#not-implemented-hide:] Streaming gRPC sink configuration sends the taps to an external gRPC
// server.
#StreamingGrpcSink: {
	"@type": "type.googleapis.com/envoy.service.tap.v2alpha.StreamingGrpcSink"

	// Opaque identifier, that will be sent back to the streaming grpc server.
	tap_id?: string

	// The gRPC server that hosts the Tap Sink Service.
	grpc_service!: core_1.#GrpcService
}
