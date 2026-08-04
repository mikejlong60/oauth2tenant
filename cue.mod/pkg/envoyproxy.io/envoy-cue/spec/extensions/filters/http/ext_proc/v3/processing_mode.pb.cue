// Code generated from envoy/extensions/filters/http/ext_proc/v3/processing_mode.proto. DO NOT EDIT.
package v3

// [#next-free-field: 7]
#ProcessingMode: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.ProcessingMode"

	// How to handle the request header.
	//
	// .. note::
	//
	//    This field is ignored in
	//    :ref:`mode_override <envoy_v3_api_field_service.ext_proc.v3.ProcessingResponse.mode_override>`,
	//    since mode overrides can only affect messages exchanged after the request header is
	//    processed.
	//
	// Defaults to ``SEND``.
	request_header_mode?: #ProcessingMode_HeaderSendMode

	// How to handle the response header.
	//
	// Defaults to ``SEND``.
	response_header_mode?: #ProcessingMode_HeaderSendMode

	// How to handle the request body.
	//
	// Defaults to ``NONE``.
	request_body_mode?: #ProcessingMode_BodySendMode

	// How to handle the response body.
	//
	// Defaults to ``NONE``.
	response_body_mode?: #ProcessingMode_BodySendMode

	// How to handle the request trailers.
	//
	// Defaults to ``SKIP``.
	request_trailer_mode?: #ProcessingMode_HeaderSendMode

	// How to handle the response trailers.
	//
	// Defaults to ``SKIP``.
	response_trailer_mode?: #ProcessingMode_HeaderSendMode
}

// Control how headers and trailers are handled.
#ProcessingMode_HeaderSendMode:
	// When used to configure the ext_proc filter
	// :ref:`processing_mode <envoy_v3_api_field_extensions.filters.http.ext_proc.v3.ExternalProcessor.processing_mode>`,
	// the default ``HeaderSendMode`` depends on which part of the message is being processed. By
	// default, request and response headers are sent, while trailers are skipped.
	//
	// When used in
	// :ref:`mode_override <envoy_v3_api_field_service.ext_proc.v3.ProcessingResponse.mode_override>`
	// or
	// :ref:`allowed_override_modes <envoy_v3_api_field_extensions.filters.http.ext_proc.v3.ExternalProcessor.allowed_override_modes>`,
	// a value of ``DEFAULT`` indicates that there is no change from the behavior that is configured
	// for the filter in
	// :ref:`processing_mode <envoy_v3_api_field_extensions.filters.http.ext_proc.v3.ExternalProcessor.processing_mode>`.
	"DEFAULT" |

	// Send the header or trailer.
	"SEND" |

	// Do not send the header or trailer.
	"SKIP"

// Control how the request and response bodies are handled.
//
// When body mutation by external processor is enabled, ext_proc filter will always remove the
// content length header in the following four cases because content length cannot be guaranteed
// to be set correctly:
//
// 1) ``STREAMED`` BodySendMode: header processing completes before body mutation comes back.
// 2) ``BUFFERED_PARTIAL`` BodySendMode: body is buffered and could be injected in different phases.
// 3) ``BUFFERED`` BodySendMode + ``SKIP`` HeaderSendMode: header processing (e.g., update content-length) is skipped.
// 4) ``FULL_DUPLEX_STREAMED`` BodySendMode: header processing completes before body mutation comes back.
//
// In Envoy's HTTP/1 codec implementation, removing content length will enable chunked transfer
// encoding whenever feasible. The recipient (either client or server) must be able to parse and
// decode the chunked transfer coding
// (see `details in RFC9112 <https://tools.ietf.org/html/rfc9112#section-7.1>`_).
//
// In ``BUFFERED`` BodySendMode + ``SEND`` HeaderSendMode, content length header is allowed but it
// is the external processor's responsibility to set the content length correctly matched to the
// length of the mutated body. If they don't match, the corresponding body mutation will be
// rejected and a local reply will be sent with an error message.
#ProcessingMode_BodySendMode:
	// Do not send the body at all. This is the default.
	"NONE" |

	// Stream the body to the server in pieces as they are seen.
	"STREAMED" |

	// Buffer the message body in memory and send the entire body at once.
	// If the body exceeds the configured buffer limit, then the
	// downstream system will receive an error.
	"BUFFERED" |

	// Buffer the message body in memory and send the entire body in one
	// chunk. If the body exceeds the configured buffer limit, then the body contents
	// up to the buffer limit will be sent.
	"BUFFERED_PARTIAL" |

	// The ext_proc client (the data plane) streams the body to the server in pieces as they arrive.
	//
	// 1) The server may choose to buffer any number of chunks of data before processing them.
	//    After it finishes buffering, the server processes the buffered data. Then it splits the
	//    processed data into any number of chunks, and streams them back to the ext_proc client one
	//    by one. The server may continuously do so until the complete body is processed. The
	//    individual response chunk size is recommended to be no greater than 64K bytes, or
	//    :ref:`max_receive_message_length <envoy_v3_api_field_config.core.v3.GrpcService.EnvoyGrpc.max_receive_message_length>`
	//    if EnvoyGrpc is used.
	//
	// 2) The server may also choose to buffer the entire message, including the headers (if header
	//    mode is ``SEND``), the entire body, and the trailers (if present), before sending back any
	//    response. The server response has to maintain the headers-body-trailers ordering.
	//
	// 3) Note that the server might also choose not to buffer data. That is, upon receiving a body
	//    request, it could process the data and send back a body response immediately.
	//
	// In this body mode:
	//
	// * The corresponding trailer mode has to be set to ``SEND``.
	// * The client will send body and trailers (if present) to the server as they arrive. Sending
	//   the trailers (if present) is to inform the server that the complete body has arrived. In
	//   case there are no trailers, then the client will set
	//   :ref:`end_of_stream <envoy_v3_api_field_service.ext_proc.v3.HttpBody.end_of_stream>`
	//   to ``true`` as part of the last body chunk request to notify the server that no other data
	//   is to be sent.
	// * The server needs to send
	//   :ref:`StreamedBodyResponse <envoy_v3_api_msg_service.ext_proc.v3.StreamedBodyResponse>`
	//   to the client in the body response.
	// * The client will stream the body chunks in the responses from the server to the
	//   upstream/downstream as they arrive.
	"FULL_DUPLEX_STREAMED" |

	// [#not-implemented-hide:]
	// A mode for gRPC traffic. This is similar to ``FULL_DUPLEX_STREAMED``, except that instead of
	// sending raw chunks of the HTTP/2 DATA frames, the ext_proc client will de-frame the
	// individual gRPC messages inside the HTTP/2 DATA frames, and as each message is de-framed, it
	// will be sent to the ext_proc server as a
	// :ref:`request_body <envoy_v3_api_field_service.ext_proc.v3.ProcessingRequest.request_body>`
	// or
	// :ref:`response_body <envoy_v3_api_field_service.ext_proc.v3.ProcessingRequest.response_body>`.
	// The ext_proc server will stream back individual gRPC messages in the
	// :ref:`StreamedBodyResponse <envoy_v3_api_msg_service.ext_proc.v3.StreamedBodyResponse>`
	// field, but the number of messages sent by the ext_proc server does not need to equal the
	// number of messages sent by the data plane. This allows the ext_proc server to change the
	// number of messages sent on the stream. In this mode, the client will send body and trailers
	// to the server as they arrive.
	"GRPC"
